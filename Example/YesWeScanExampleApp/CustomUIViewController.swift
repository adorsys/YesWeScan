//
//  CustomUIViewController.swift
//  YesWeScanExampleApp
//
//  Created by Xaver Lohmüller on 02.05.19.
//  Copyright © 2019 adorsys GmbH & Co KG. All rights reserved.
//

import YesWeScan

final class CustomUIViewController: UIViewController {
    private lazy var scanner: DocumentScanner = AVDocumentScanner(delegate: self)

    private var detectionLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.red.withAlphaComponent(0.3).cgColor
        layer.strokeColor = UIColor.red.withAlphaComponent(0.9).cgColor
        layer.lineWidth = 2
        layer.contentsGravity = .resizeAspectFill
        return layer
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        scanner.previewLayer.frame = UIScreen.main.bounds
        view.layer.addSublayer(scanner.previewLayer)
        scanner.previewLayer.addSublayer(detectionLayer)
    }
}


extension CustomUIViewController: DocumentScannerDelegate {
    func didCapture(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.showAnimated(on: view)

        scanner.stop()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            imageView.hideAnimated()
            self.scanner.start()
        }
    }

    func didRecognize(feature: RectangleFeature?, in image: CIImage) {
        detectionLayer.path = feature?.bezierPath.cgPath
    }
}

private extension UIView {
    func showAnimated(on view: UIView, duration: TimeInterval = 0.5) {
        frame = view.frame
        alpha = 0
        view.addSubview(self)
        UIView.animate(withDuration: duration) {
            self.alpha = 1
        }
    }

    func hideAnimated(duration: TimeInterval = 0.5) {
        UIView.animate(withDuration: duration,
                       animations: { self.alpha = 0 },
                       completion: { _ in self.removeFromSuperview() })
    }
}
