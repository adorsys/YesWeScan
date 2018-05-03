import UIKit

public protocol ScannerViewControllerDelegate: class {
    func scanner(_ scanner: ScannerViewController, didCaptureImage image: UIImage)
}
