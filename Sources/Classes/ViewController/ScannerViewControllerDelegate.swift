import UIKit

public protocol ScannerViewControllerDelegate: AnyObject {
    @available(*, deprecated, message: "Use scanner(_ scanner:, didCaptureImages:) instead")
    func scanner(_ scanner: ScannerViewController, didCaptureImage image: UIImage)

    func scanner(_ scanner: ScannerViewController, didCaptureImages images: [UIImage])
}

public extension ScannerViewControllerDelegate {
    func scanner(_ scanner: ScannerViewController, didCaptureImages images: [UIImage]) {
        guard let image = images.first else { fatalError("Ja ja") }
        self.scanner(scanner, didCaptureImage: image)
    }
}
