import AVFoundation

protocol DocumentScanner {

    /// Jitter of automatic capture. Higher values will capture images faster,
    /// but will reduce quality. Default value is 100.
    var desiredJitter: CGFloat { get set }

    /// A layer for preview in the view controller. The scanner assumes that
    /// this will have the same bounds as the device's screen
    var previewLayer: CALayer { get }

    /// Manually capture an image in given bounds
    ///
    /// - Parameters:
    ///   - bounds: In the coordinate space of the screen
    ///   - completion: Called with the captured image
    func captureImage(in bounds: RectangleFeature?, completion: @escaping (UIImage) -> Void)

    /// Creates a scanner with the supplied, immutable delegate
    ///
    /// - Parameter delegate: Is captured using a weak pointer
    init(sessionPreset: AVCaptureSession.Preset, delegate: DocumentScannerDelegate)

    func start()
    func pause()
    func stop()
}
