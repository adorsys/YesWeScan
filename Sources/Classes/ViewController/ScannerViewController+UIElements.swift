import UIKit

extension ScannerViewController {
    func makeTargetBraceButton() -> UIView {
        let view = blurView()

        let image = UIImageView(image: .targetBracesToggleImage)
        image.translatesAutoresizingMaskIntoConstraints = false
        view.contentView.addSubview(image)
        view.centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleTargetBraces))
        view.addGestureRecognizer(tap)

        return view
    }

    func makeTorchButton() -> UIView {
        let view = blurView()

        let image = UIImageView(image: .torchImage)
        image.translatesAutoresizingMaskIntoConstraints = false
        view.contentView.addSubview(image)
        view.centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true

        let action = #selector(showTorchUI)
        if UIScreen.main.traitCollection.forceTouchCapability == .available {
            let forceTap = ForceTouchGestureRecognizer(target: self, action: action)
            view.addGestureRecognizer(forceTap)
        } else {
            let tap = UITapGestureRecognizer(target: self, action: #selector(toggleTorch))
            view.addGestureRecognizer(tap)

            let longPress = UILongPressGestureRecognizer(target: self, action: action)
            view.addGestureRecognizer(longPress)
        }

        return view
    }

    func takePhotoButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.buttonImage, for: .normal)
        button.addTarget(self,
                         action: #selector(captureScreen),
                         for: .touchUpInside)
        return button
    }

    func makeProgressBar() -> UIProgressView {
        let progressBar = UIProgressView()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }
}

private func blurView() -> UIVisualEffectView {
    let blurEffect = UIBlurEffect(style: .light)
    let view = UIVisualEffectView(effect: blurEffect)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.widthAnchor.constraint(equalToConstant: 64).isActive = true
    view.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    view.layer.cornerRadius = 12
    view.clipsToBounds = true

    return view
}
