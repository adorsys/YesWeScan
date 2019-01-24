import UIKit

public protocol ScannerViewControllerDelegate: AnyObject {
    func scanner(_ scanner: ScannerViewController, didCaptureImage image: UIImage)
}
