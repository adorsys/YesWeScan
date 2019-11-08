import UIKit

extension ScannerViewController {
    func makeTargetBraceButton() -> UIView {
        let view = blurView()

        let focusView = FocusRectView()
        focusView.translatesAutoresizingMaskIntoConstraints = false
        view.contentView.addSubview(focusView)

        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: focusView.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: focusView.centerYAnchor),
            view.widthAnchor.constraint(equalTo: focusView.widthAnchor, multiplier: 2),
            view.heightAnchor.constraint(equalTo: focusView.heightAnchor, multiplier: 2)
        ])

        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleTargetBraces))
        view.addGestureRecognizer(tap)

        return view
    }

    func makeTorchButton() -> UIView {
        let view = blurView()

        let torchImage: UIView

        if #available(iOS 13.0, *) {
            let image = UIImage(systemName: "flashlight.off.fill")
            let imageView = UIImageView(image: image?.withRenderingMode(.alwaysTemplate))
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = .black
            torchImage = imageView
        } else {
            let label = UILabel()
            label.text = "🔦"
            torchImage = label
        }

        torchImage.translatesAutoresizingMaskIntoConstraints = false
        view.contentView.addSubview(torchImage)
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: torchImage.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: torchImage.centerYAnchor),
            view.widthAnchor.constraint(equalTo: torchImage.widthAnchor, multiplier: 2),
            view.heightAnchor.constraint(equalTo: torchImage.heightAnchor, multiplier: 2)
        ])

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

    func takePhotoButtonView() -> UIView {
        let view = TriggerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(captureScreen))
               view.addGestureRecognizer(tap)
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 66),
            view.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
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
