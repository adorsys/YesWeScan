import UIKit

@objc public protocol ScannerViewControllerDelegate {
    func scanner(_ scanner: ScannerViewController, didCaptureImage image: UIImage)
}
