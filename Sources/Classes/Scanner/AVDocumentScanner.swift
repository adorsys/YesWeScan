import AVFoundation
import CoreMedia

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
        imageCapturer = ImageCapturer(session: session)
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
        self.captureSession.addOutput(output)
        output.connection(with: .video)?.videoOrientation = .portrait
        return output
    }()

    private let detector = CIDetector(ofType: CIDetectorTypeRectangle, context: nil, options: [
        CIDetectorAccuracy: CIDetectorAccuracyHigh,
        CIDetectorMaxFeatureCount: 10
    ])!
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
        let feature = detector.features(in: image)
            .compactMap { $0 as? CIRectangleFeature }
            .map(RectangleFeature.init)
            .max()
            .map {
                $0.normalized(source: image.extent.size,
                              target: UIScreen.main.bounds.size)
            }
            .flatMap { smooth(feature: $0, in: image) }

        DispatchQueue.main.async {
            self.delegate?.didRecognize(feature: feature, in: image)
        }
    }

    func smooth(feature: RectangleFeature?, in image: CIImage) -> RectangleFeature? {
        guard let feature = feature else { return nil }

        let (smoothed, newFeatures) = feature.smoothed(with: lastFeatures)
        lastFeatures = newFeatures

        if newFeatures.count > 7,
            newFeatures.jitter < desiredJitter,
            isStopped == false,
            let delegate = delegate {

            pause()

            captureImage(in: smoothed) { [weak delegate] image in
                delegate?.didCapture(image: image)
            }
        }

        return smoothed
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
