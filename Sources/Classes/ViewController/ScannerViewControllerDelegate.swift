import UIKit

@objc public protocol ScannerViewControllerDelegate: AnyObject {
    func scanner(_ scanner: ScannerViewController, didCaptureImage image: UIImage)
}
