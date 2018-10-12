protocol DocumentScannerDelegate: class {
    // Always called on main queue
    func didCapture(image: UIImage)
    func didRecognize(feature: RectangleFeature?, in image: CIImage)
}
