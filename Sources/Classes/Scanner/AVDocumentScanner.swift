import AVFoundation
import UIKit

final class AVDocumentScanner: NSObject {
    var lastTorchLevel: Float = 0
    var desiredJitter: CGFloat = 100

    lazy var previewLayer: CALayer = {
        let layer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        layer.videoGravity = .resizeAspectFill
        return layer
    }()

    init(sessionPreset: AVCaptureSession.Preset) {
        let session = AVCaptureSession()

        if let device = self.device {
            do {
                try device.lockForConfiguration()
                device.focusMode = .continuousAutoFocus
                device.unlockForConfiguration()

                let input = try AVCaptureDeviceInput(device: device)

                session.beginConfiguration()
                if device.supportsSessionPreset(sessionPreset) {
                    session.sessionPreset = sessionPreset
                }
                session.addInput(input)
                session.commitConfiguration()
                session.startRunning()
            } catch {
                fatalError("Device couldn't be initialized")
            }
        }

        captureSession = session
        imageCapturer = ImageCapturer(session: session, context: imageContext)
        super.init()
        output.setSampleBufferDelegate(self, queue: imageQueue)
    }

    convenience init(sessionPreset: AVCaptureSession.Preset = .photo,
                     delegate: DocumentScannerDelegate) {
        self.init(sessionPreset: sessionPreset)
        self.delegate = delegate
    }

    private weak var delegate: DocumentScannerDelegate?
    private var isStopped = false
    private let imageCapturer: ImageCapturer
    private var lastFeatures: [RectangleFeature] = []
    private let captureSession: AVCaptureSession
    private let imageQueue = DispatchQueue(label: "imageQueue")
    private let imageContext = CIContext()
    private lazy var rectRecognizer = RectRecognizer(context: imageContext)
    private lazy var textRecognizer = TextRecognizer(context: imageContext)

    private let device: AVCaptureDevice? = {
        AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .back
        ).devices
        .first { $0.hasTorch }
    }()

    private lazy var output: AVCaptureVideoDataOutput = {
        let output = AVCaptureVideoDataOutput()

        output.videoSettings = [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA
        ]
        captureSession.addOutput(output)
        output.connection(with: .video)?.videoOrientation = .portrait
        return output
    }()
}

extension AVDocumentScanner: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_: AVCaptureOutput,
                       didOutput sampleBuffer: CMSampleBuffer,
                       from _: AVCaptureConnection) {

        guard isStopped == false,
            CMSampleBufferIsValid(sampleBuffer),
            let buffer = CMSampleBufferGetImageBuffer(sampleBuffer)
            else { return }

        let image = CIImage(cvImageBuffer: buffer)

        let feature = rectRecognizer.detectRect(in: image)
        let textBoxes = textRecognizer.detectText(in: image)

        DispatchQueue.main.async {
            self.delegate?.didRecognize(feature: feature, in: image)
            self.delegate?.didFindTextBoxes(boxes: textBoxes.0, images: textBoxes.1)
        }

        if rectRecognizer.jitter < desiredJitter,
            isStopped == false,
            let delegate = delegate {

            pause()

            captureImage(in: feature) { [weak delegate] image in
                delegate?.didCapture(image: image)
            }
        }
    }
}

extension AVDocumentScanner: DocumentScanner {
    func captureImage(in bounds: RectangleFeature?, completion: @escaping (UIImage) -> Void) {
        imageCapturer.captureImage(in: bounds, completion: completion)
    }
    func start() {
        guard !captureSession.isRunning else {
            return
        }
        captureSession.startRunning()
        isStopped = false
    }
    func pause() {
        isStopped = true
    }
    func stop() {
        guard captureSession.isRunning else {
            return
        }
        captureSession.stopRunning()
    }
}

extension AVDocumentScanner: TorchPickerViewDelegate {
    func toggleTorch() {
        do {
            try device?.lockForConfiguration()
            if device?.torchMode == .off {
                let level = lastTorchLevel != 0 ? lastTorchLevel : 0.5
                try device?.setTorchModeOn(level: level)
                lastTorchLevel = level
            } else {
                device?.torchMode = .off
                lastTorchLevel = 0
            }
            device?.unlockForConfiguration()
        } catch {}
    }

    func didPickTorchLevel(_ level: Float) {
        lastTorchLevel = level
        do {
            try device?.lockForConfiguration()
            switch level {
            case 0:
                device?.torchMode = .off
                lastTorchLevel = 0
            default:
                try device?.setTorchModeOn(level: level)
            }
            device?.unlockForConfiguration()
        } catch {}
    }
}
