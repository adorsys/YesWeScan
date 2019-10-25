import UIKit
import CoreImage

// Methods are always called on main queue
public protocol DocumentScannerDelegate: AnyObject {

    /// Called when the scanner successfully found an image
    ///
    /// - Parameter image: The image that was found
    func didCapture(image: UIImage)

    /// Use this method to display a preview border of the image that is about
    /// to be recognized
    ///
    /// - Parameters:
    ///   - feature: The extent of the image that is being recognized
    ///   - image: The image that contains the image to be recognized
    func didRecognize(feature: RectangleFeature?, in image: CIImage)
}
