//
//  ScannerViewController.swift
//  DocumentScanner
//
//  Created by Xaver Lohmueller on 22.09.17.
//

import UIKit
import AVFoundation

public final class ScannerViewController: UIViewController {

    public weak var delegate: ScannerViewControllerDelegate?
    public var jitter: CGFloat {
        set { scanner.desiredJitter = newValue }
        get { return scanner.desiredJitter }
    }
    public var braceColor: UIColor = .red
    public var previewColor: UIColor = .green {
        didSet {
            detectionLayer.fillColor = previewColor.withAlphaComponent(0.3).cgColor
            detectionLayer.strokeColor = previewColor.withAlphaComponent(0.9).cgColor
        }
    }
    public var textBoxColor: UIColor = .blue

    public init(sessionPreset: AVCaptureSession.Preset = .photo, config: ScannerConfig = .all) {
        self.sessionPreset = sessionPreset
        super.init(nibName: nil, bundle: nil)
        setupUI(config: config)
    }
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    private let sessionPreset: AVCaptureSession.Preset
    @IBOutlet private weak var targetView: UIView!
    @IBOutlet private weak var targetButton: UIView!
    @IBOutlet private weak var torchButton: UIView!

    @IBOutlet private weak var imageView: UIImageView!

    private lazy var scanner: DocumentScanner & TorchPickerViewDelegate = {
        AVDocumentScanner(sessionPreset: self.sessionPreset, delegate: self)
    }()

    private lazy var detectionLayer: CAShapeLayer = {
        $0.fillColor = previewColor.withAlphaComponent(0.3).cgColor
        $0.strokeColor = previewColor.withAlphaComponent(0.9).cgColor
        $0.lineWidth = 2
        $0.contentsGravity = .resizeAspectFill
        $0.frame = view.frame
        return $0
    }(CAShapeLayer())

    private lazy var textboxLayer: CAShapeLayer = {
        $0.fillColor = UIColor.clear.cgColor
        $0.strokeColor = textBoxColor.cgColor
        $0.lineWidth = 1
        $0.contentsGravity = .resizeAspectFill
        $0.frame = view.frame
        return $0
    }(CAShapeLayer())

    private func setupCameraPreview() {
        let cameraView = UIView(frame: view.frame)
        let previewLayer = scanner.previewLayer
        previewLayer.frame = view.bounds
        cameraView.layer.addSublayer(previewLayer)

        view.addSubview(cameraView)

        previewLayer.addSublayer(detectionLayer)
        detectionLayer.path = nil

        previewLayer.addSublayer(textboxLayer)
        textboxLayer.path = nil
    }

    private func addTextboxes(for boxes: [RectangleFeature]) {
        let path = boxes
            .map { $0.bezierPath }
            .reduce(into: UIBezierPath()) { result, path in
                result.append(path)
            }

        textboxLayer.path = path.cgPath
    }

    private func showFirstImage(_ images: [CIImage]) {
        guard let image = images.first else {
            imageView.image = nil
            return
        }

        imageView.image = UIImage(ciImage: image)
    }

    private func setupUI(config: ScannerConfig) {

        if config.contains(.manualCapture) {
            let button = takePhotoButton()
            view.addSubview(button)
            view.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: 16).isActive = true
        }

        if config.contains(.targetBraces) {
            let targetBraceButton = makeTargetBraceButton()
            targetButton = targetBraceButton
            view.addSubview(targetBraceButton)
            view.leadingAnchor.constraint(equalTo: targetBraceButton.leadingAnchor, constant: -8).isActive = true
            view.bottomAnchor.constraint(equalTo: targetBraceButton.bottomAnchor, constant: 8).isActive = true

            let braces = TargetBraceView()
            braces.color = braceColor
            braces.isHidden = true
            braces.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(braces)
            view.centerXAnchor.constraint(equalTo: braces.centerXAnchor).isActive = true
            view.centerYAnchor.constraint(equalTo: braces.centerYAnchor, constant: 50).isActive = true
            view.widthAnchor.constraint(equalTo: braces.widthAnchor, multiplier: 1.5).isActive = true
            braces.heightAnchor.constraint(equalTo: braces.widthAnchor, multiplier: 1.5).isActive = true
            self.targetView = braces
        }

        if config.contains(.torch) {
            let torch = makeTorchButton()
            torchButton = torch
            view.addSubview(torch)
            view.trailingAnchor.constraint(equalTo: torch.trailingAnchor, constant: 8).isActive = true
            view.bottomAnchor.constraint(equalTo: torch.bottomAnchor, constant: 8).isActive = true
        }

        // DEBUG
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor)
        ])
        self.imageView = imageView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        setupCameraPreview()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        scanner.start()
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.view.subviews
            .first { $0 is TorchPickerView }?
            .removeFromSuperview()

        scanner.stop()
    }
}

// Actions
extension ScannerViewController {
    @objc
    func captureScreen() {
        let boundingRect: RectangleFeature?
        if targetView.isHidden {
            boundingRect = nil
        } else {
            boundingRect = RectangleFeature(
                topLeft: targetView.frame.origin,
                topRight: targetView.frame.origin + CGPoint(x: targetView.frame.width, y: 0),
                bottomLeft: targetView.frame.origin + CGPoint(x: 0, y: targetView.frame.height),
                bottomRight: targetView.frame.origin + CGPoint(x: targetView.frame.width, y: targetView.frame.height)
            )
        }

        scanner.captureImage(in: boundingRect) { [weak self] image in
            if let scanner = self {
                scanner.scanner.stop()
                self?.delegate?.scanner(scanner, didCaptureImage: image)
            }
        }
    }

    @objc
    func toggleTargetBraces() {
        let newColor: UIColor = targetButton.backgroundColor == .white ? .clear : .white
        targetButton.backgroundColor = newColor
        targetView.isHidden = !targetView.isHidden
    }

    @objc
    func toggleTorch() {
        setTorchUIOn(lastTorchLevel == 0)
        scanner.toggleTorch()
    }

    private func setTorchUIOn(_ on: Bool) {
        torchButton.backgroundColor = on ? .white : .clear
    }

    @objc
    func showTorchUI(_ sender: Any) {
        let superview = navigationController?.view ?? self.view!

        guard superview.subviews
            .contains(where: { $0 is TorchPickerView }) == false
            else { return }

        if let forceTap = sender as? ForceTouchGestureRecognizer {
            if forceTap.force < 0.25 && forceTap.state == .ended {
                toggleTorch()
                return
            }

            guard forceTap.force > 0.75 else { return }
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.prepare()
            generator.impactOccurred()
        }
        let picker = TorchPickerView(frame: view.frame)
        picker.torchLevel = scanner.lastTorchLevel
        picker.frame.origin.y = self.torchButton.frame.height
        picker.delegate = self
        superview.addSubview(picker)
        picker.frame.origin.x = self.view.frame.width
        UIView.animate(withDuration: 0.5) {
            picker.frame.origin.x = self.view.frame.width - picker.frame.width
        }
    }
}

extension ScannerViewController: DocumentScannerDelegate {
    func didCapture(image: UIImage) {
        if let delegate = delegate {
            scanner.pause()
            delegate.scanner(self, didCaptureImage: image)
        }
    }

    func didRecognize(feature: RectangleFeature?, in image: CIImage) {
        guard let feature = feature else { detectionLayer.path = nil; return }

        detectionLayer.path = feature.bezierPath.cgPath
    }

    func didFindTextBoxes(boxes: [RectangleFeature], images: [CIImage]) {
        addTextboxes(for: boxes)
        showFirstImage(images)
    }
}

extension ScannerViewController: TorchPickerViewDelegate {
    var lastTorchLevel: Float { return scanner.lastTorchLevel }

    func didPickTorchLevel(_ level: Float) {
        guard level != lastTorchLevel else { return }

        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.prepare()
        generator.impactOccurred()

        setTorchUIOn(level != 0)
        scanner.didPickTorchLevel(level)
    }
}
