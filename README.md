# DocumentScanner

[![Swift 4.0](https://img.shields.io/badge/Swift-4.0-orange.svg)](https://swift.org)
[![license](https://img.shields.io/badge/license-Apache_2.0-lightgrey.svg)](https://github.com/adorsys/document-scanner-ios/blob/master/LICENSE)
[![platform](https://img.shields.io/badge/platform-iOS_10+-lightgrey.svg)](https://img.shields.io/badge/platform-iOS_10+-lightgrey.svg)

This pod contains a ready to use view controller for document scanning.

## Requirements
- iOS 10.0 SDK or later

## Installation
DocumentScanner is available through [CocoaPods](http://cocoapods.org). To
install it, simply add the following line to your Podfile:

```ruby
pod 'DocumentScanner', :git => 'https://github.com/adorsys/document-scanner-ios'
```

## Using this Pod

#### Scanner View Controller

The main class in this project is `ScannerViewController`. You can access it
with `import DocumentScanner`.

```swift
class ViewController: UIViewController,  {
  var scannedImage: UIImage?

  override func viewDidLoad() {
    super.viewDidLoad()
    let scanner = ScannerViewController()
    scanner.delegate = self
    navigationController?.pushViewController(scanner, animated: true)
  }
}
```

#### Delegate Methods

The scanner will __not__ capture images without a delegate.
You should therefore set the `delegate` property of the scanner VC.

You will then receive calls when the scanner found an image of suitable quality:

```swift
extension ViewController: ScannerViewControllerDelegate {
  func didCapture(image: UIImage) {
    scannedImage = image
    navigationController?.popViewController(animated: true)
  }
}
```

#### Scanner Quality

You can customize the scanner's accuracy using the `jitter` property. Higher
values will make it easier to capture an image, but it won't be as steady.

The default value here is `100`.

The Scanner resolution can be configured by passing the `ScannerViewController`
an `AVCaptureSession.Preset` during initialization. The default value is
`.high`. If the given preset isn't supported by the capture device, it'll fall
back to the default value.

#### UI Configuration

The scanner's UI can be configured using the initializer:

```swift
ScannerViewController(config: [.all])
```

The following options are available:

+ `.targetBraces`: A button to toggle targeting braces
+ `.torch`: A button for controlling the torch
+ `.manualCapture`: A manual camera shutter

The default value here is `.all`

You can also configure the `previewColor` (color of scan preview rect) and
`braceColor` (color of the target finder braces).

The defaults here are `UIColor.green` and `UIColor.red`, respectively.

#### Performance hint

The scanner takes quite some time to fire up the AVCaptureSession, etc, which
means initializing a `ScannerViewController` is expensive.

Depending on your use case, it probably makes sense to store a strong reference
to the `ScannerViewController` in the presenting View Controller (as seen in
the Example project).

## License

DocumentScanner is released under the **Apache 2.0 License**. Please see the [LICENSE](https://github.com/adorsys/document-scanner-ios/blob/master/LICENSE) file for more information.
