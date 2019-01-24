import UIKit
import CoreImage

protocol DocumentScannerDelegate: AnyObject {
    // Always called on main queue
    func didCapture(image: UIImage)
    func didRecognize(feature: RectangleFeature?, in image: CIImage)
}
