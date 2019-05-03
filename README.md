<p align="center">
    <img src="https://raw.githubusercontent.com/adorsys/YesWeScan/master/Images/banner.jpg" width="1700" max-width="100%" alt="YesWeScan" />
</p>

[![Build Status](https://travis-ci.com/adorsys/YesWeScan.svg?branch=master)](https://travis-ci.com/adorsys/YesWeScan.svg?branch=master)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
[![license](https://img.shields.io/badge/license-Apache_2.0-lightgrey.svg)](https://github.com/adorsys/YesWeScan/blob/master/LICENSE)
[![platform](https://img.shields.io/badge/platform-iOS_10+-lightgrey.svg)](https://img.shields.io/badge/platform-iOS_10+-lightgrey.svg)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

This pod contains a ready to use view controller for document scanning. Yes we scan!

- [Requirements](#requirements)
- [Scanner Preview](#scanner-preview)
- [Installation](#installation)
  - [CocoaPods](#cocoapods)
  - [Carthage](#carthage)
- [Usage](#usage)
  - [Scanner View Controller](#scanner-view-controller)
  - [Delegate Methods](#delegate-methods)
  - [Scanner Quality](#scanner-quality)
  - [Image Features needed before automatically capture](#image-features-needed-before-automatically-capture)
  - [UI Configuration](#ui-configuration)
  - [Performance hint](#performance-hint)
  - [Siri Shortcuts](#siri-shortcuts)
  - [Using the scanner directly](#using-the-scanner-directly)
- [License](#license)

## Requirements

- iOS 10.0 SDK or later

| Xcode Version | YesWeScan |
|---------------|-----------|
| <= 10.1       | <= 1.3.0  |
| 10.2          | => 2.0.0  |

## Scanner Preview

<img src="https://raw.githubusercontent.com/adorsys/YesWeScan/master/Images/preview.GIF" width="250" max-width="50%" alt="Demo" />

## Installation

### CocoaPods

YesWeScan is available through [CocoaPods](http://cocoapods.org).
To install it, simply add the following line to your `Podfile`:

```ruby
pod 'YesWeScan', ~> '2.0'
```

### Carthage

YesWeScan is also available via [Carthage](https://github.com/Carthage/Carthage).
Add the following line to your `Cartfile`:

```
github "adorsys/YesWeScan"
```

## Usage

### Scanner View Controller

The main class in this project is `ScannerViewController`. You can access it
with `import YesWeScan`.

```swift
import YesWeScan

class ViewController: UIViewController {
  var scannedImage: UIImage?

  override func viewDidLoad() {
    super.viewDidLoad()

    let scanner = ScannerViewController()
    scanner.delegate = self
    navigationController?.pushViewController(scanner, animated: true)
  }
}
```

### Delegate Methods

The scanner will __not__ capture images without a delegate.
You should therefore set the `delegate` property of the `ScannerViewController`.

You will then receive calls when the scanner found an image of suitable quality:

```swift
extension ViewController: ScannerViewControllerDelegate {
  func scanner(_ scanner: ScannerViewController, didCaptureImage image: UIImage) {
    scannedImage = image
    navigationController?.popViewController(animated: true)
  }
}
```

### Scanner Quality

You can customize the scanner's accuracy using the `jitter` property. Higher
values will make it easier to capture an image, but it won't be as steady.

The default value here is `100`.

The Scanner resolution can be configured by passing the `ScannerViewController`
an `AVCaptureSession.Preset` during initialization. The default value is
`.high`. If the given preset isn't supported by the capture device, it'll fall
back to the default value.

### Image Features needed before automatically capture

You can change the variable `scanningQuality` to control the scanning quality
of the image. Changes to `scanningQuality` will influence the number of
features required before taking a capture.

```swift
enum Quality {
  case high, medium, fast
}
```

The default value is `.medium` and this variable is available
in `ScannerViewController`.

```swift
scanner.scanningQuality = .fast
```

### UI Configuration

The scanner's UI can be configured using the initializer:

```swift
ScannerViewController(config: [.torch, .manualCapture])
```

The following options are available:

+ `.targetBraces`: A button to toggle targeting braces
+ `.torch`: A button for controlling the torch
+ `.manualCapture`: A manual camera shutter
+ `.progressBar`: Show a progress bar for the current scan

The default value here is `.all`.

You can also configure the `previewColor` (color of scan preview rect) and
`braceColor` (color of the target finder braces).

The defaults here are `UIColor.green` and `UIColor.red`, respectively.

### Performance hint

The scanner takes quite some time to fire up the AVCaptureSession, etc, which
means initializing a `ScannerViewController` is expensive.

Depending on your use case, it probably makes sense to store a strong reference
to the `ScannerViewController` in the presenting View Controller (as seen in
the Example project).

### Siri Shortcuts

The scanner example project supports Siri Shortcuts since iOS 12*.
The User own shortcut opens the app and navigates to the Document Scanner.
You can find the implementation in the example project.

The implementation works as follows:
Activate Siri in the project and add a `NSUserActivityTypes` identifier in `info.plist`.
Then activate Siri Shortcut adding following lines in the project:

```swift
if #available(iOS 12.0, *) {
  let identifier = Bundle.main.userActivityIdentifier
  let activity = NSUserActivity(activityType: identifier)
  activity.title = "The String the User will see in preferences"
  activity.userInfo = ["Document Scanner": "open document scanner"]
  activity.isEligibleForSearch = true
  activity.isEligibleForPrediction = true
  activity.persistentIdentifier = NSUserActivityPersistentIdentifier(identifier)
  view.userActivity = activity
  activity.becomeCurrent()
}
```

To call a specific function, like `openDocumentScanner()`, add this to `AppDelegate`:

```swift
func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
  if #available(iOS 12.0, *) {
    guard userActivity.activityType == Bundle.main.userActivityIdentifier,
      let navigationController = window?.rootViewController as? UINavigationController,
      let viewController = navigationController.children.first as? ViewController else {
        return false
    }
    viewController.openDocumentScanner()
    return true
  } else {
    return false
  }
}
```

### Using the scanner directly

It's also possible to use the scanner class without the `ScannerViewController`
class (that is part of this pod) directly.

As an example how to do this, take a look at the [`CustomUIViewController`][custom VC] class.

[custom VC]: https://github.com/adorsys/YesWeScan/blob/master/Example/YesWeScanExampleApp/CustomUIViewController.swift

## License

YesWeScan is released under the **Apache 2.0 License**. Please see the [LICENSE](https://github.com/adorsys/YesWeScan/blob/master/LICENSE) file for more information.
