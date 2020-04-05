import AVFoundation
import UIKit

public final class AVDocumentScanner: NSObject {
    var lastTorchLevel: Float = 0
    public var desiredJitter: CGFloat = 100 {
        didSet { progress.completedUnitCount = Int64(desiredJitter) }
    }
    public var featuresRequired = 7
    public var hasTorch: Bool = false
    public let progress = Progress()

    public lazy var previewLayer: CALayer = {
        let layer = AVCaptureVideoPreviewLayer(session: captureSession)
        layer.videoGravity = .resizeAspectFill
        return layer
    }()

    init(sessionPreset: AVCaptureSession.Preset) {
        imageCapturer = ImageCapturer(session: captureSession)
        super.init()

        progress.completedUnitCount = Int64(desiredJitter)
        hasTorch = device?.hasTorch ?? false

        imageQueue.async {
            guard let device = self.device,
                let input = try? AVCaptureDeviceInput(device: device)
                else { return }

            try? device.lockForConfiguration()
            device.focusMode = .continuousAutoFocus
            device.unlockForConfiguration()

            self.captureSession.beginConfiguration()
            if device.supportsSessionPreset(sessionPreset) {
                self.captureSession.sessionPreset = sessionPreset
            }
            self.captureSession.addInput(input)
            self.captureSession.commitConfiguration()
            self.captureSession.startRunning()
            self.output.setSampleBufferDelegate(self, queue: self.imageQueue)
        }
    }

    public convenience init(sessionPreset: AVCaptureSession.Preset = .photo,
                            delegate: DocumentScannerDelegate) {
        self.init(sessionPreset: sessionPreset)
        self.delegate = delegate
    }

    private weak var delegate: DocumentScannerDelegate?
    private var isStopped = false
    private let imageCapturer: ImageCapturer
    private var rectangleFeatures: [RectangleFeature] = []
    private let captureSession = AVCaptureSession()
    private let imageQueue = DispatchQueue(label: "imageQueue")

    private let device: AVCaptureDevice? = {
        AVCaptureDevice.DiscoverySession(
            deviceTypes: [.builtInWideAngleCamera],
            mediaType: .video,
            position: .back
            ).devices
            .first
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

    private let detector = CIDetector(ofType: CIDetectorTypeRectangle, context: nil, options: [
        CIDetectorAccuracy: CIDetectorAccuracyHigh,
        CIDetectorMaxFeatureCount: 10

        // swiftlint:disable:next force_unwrapping
    ])!
}

extension AVDocumentScanner: AVCaptureVideoDataOutputSampleBufferDelegate {
    public func captureOutput(_: AVCaptureOutput,
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

        let smoothed = feature.smoothed(with: &rectangleFeatures)
        progress.totalUnitCount = Int64(rectangleFeatures.jitter)

        if rectangleFeatures.count > featuresRequired,
            rectangleFeatures.jitter < desiredJitter,
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
    public func captureImage(in bounds: RectangleFeature?, completion: @escaping (UIImage) -> Void) {
        imageCapturer.captureImage(in: bounds, completion: completion)
    }

    public func start() {
        imageQueue.async {
            guard !self.captureSession.isRunning else { return }
            self.captureSession.startRunning()
            self.isStopped = false
        }
    }

    public func pause() {
        isStopped = true
    }

    public func stop() {
        guard captureSession.isRunning else { return }
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
            if level == 0 {
                device?.torchMode = .off
                lastTorchLevel = 0
            } else {
                try device?.setTorchModeOn(level: level)
            }
            device?.unlockForConfiguration()
        } catch {}
    }
}
