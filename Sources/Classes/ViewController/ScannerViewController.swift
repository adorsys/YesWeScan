//
//  ScannerViewController.swift
//  DocumentScanner
//
//  Created by Xaver Lohmueller on 22.09.17.
//

import UIKit
import AVFoundation

public final class ScannerViewController: UIViewController {

    private var observer: Any?

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

    public enum Quality {
        case high, medium, fast
    }

    public var scanningQuality: Quality = .medium {
        didSet {
            switch scanningQuality {
            case .fast:
                scanner.featuresRequired = 1
            case .medium:
                scanner.featuresRequired = 3
            case .high:
                scanner.featuresRequired = 7
            }
        }
    }

    public var progress: Progress {
        return scanner.progress
    }

    public init(sessionPreset: AVCaptureSession.Preset = .photo, config: ScannerConfig = .all) {
        self.sessionPreset = sessionPreset
        super.init(nibName: nil, bundle: nil)
        setupUI(config: config)
        observer = progress.observe(\.fractionCompleted) { [weak self] progress, _ in
            DispatchQueue.main.async {
                self?.progressBar?.setProgress(Float(progress.fractionCompleted), animated: true)
            }
        }
        edgesForExtendedLayout.remove(.top)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    private let sessionPreset: AVCaptureSession.Preset
    @IBOutlet private weak var targetView: UIView!
    @IBOutlet private weak var targetButton: UIView!
    @IBOutlet private weak var torchButton: UIView!
    @IBOutlet private weak var progressBar: UIProgressView!

    private lazy var scanner: DocumentScanner & TorchPickerViewDelegate = {
        AVDocumentScanner(sessionPreset: sessionPreset, delegate: self)
    }()

    private lazy var detectionLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = previewColor.withAlphaComponent(0.3).cgColor
        layer.strokeColor = previewColor.withAlphaComponent(0.9).cgColor
        layer.lineWidth = 2
        layer.contentsGravity = .resizeAspectFill
        return layer
    }()

    private func setupCameraPreview() {
        let cameraView = UIView(frame: view.frame)
        let previewLayer = scanner.previewLayer
        previewLayer.frame = view.bounds
        cameraView.layer.addSublayer(previewLayer)

        view.addSubview(cameraView)

        previewLayer.addSublayer(detectionLayer)
        detectionLayer.frame = view.frame
        detectionLayer.path = nil
    }

    private func setupUI(config: ScannerConfig) {

        if config.contains(.manualCapture) {
            let button = takePhotoButton()
            view.addSubview(button)
            view.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true

            if #available(iOS 11.0, *) {
                view.safeAreaLayoutGuide
                    .bottomAnchor
                    .constraint(equalTo: button.bottomAnchor, constant: 8)
                    .isActive = true
            } else {
                view.bottomAnchor
                    .constraint(equalTo: button.bottomAnchor, constant: 16)
                    .isActive = true
            }
        }

        if config.contains(.targetBraces) {
            let targetBraceButton = makeTargetBraceButton()
            targetButton = targetBraceButton
            view.addSubview(targetBraceButton)
            view.leadingAnchor.constraint(equalTo: targetBraceButton.leadingAnchor, constant: -8).isActive = true

            if #available(iOS 11.0, *) {
                view.safeAreaLayoutGuide
                    .bottomAnchor
                    .constraint(equalTo: targetBraceButton.bottomAnchor, constant: 8)
                    .isActive = true
            } else {
                view.bottomAnchor
                    .constraint(equalTo: targetBraceButton.bottomAnchor, constant: 8)
                    .isActive = true
            }

            let braces = TargetBraceView()
            braces.color = braceColor
            braces.isHidden = true
            braces.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(braces)
            view.centerXAnchor.constraint(equalTo: braces.centerXAnchor).isActive = true
            view.centerYAnchor.constraint(equalTo: braces.centerYAnchor, constant: 50).isActive = true
            view.widthAnchor.constraint(equalTo: braces.widthAnchor, multiplier: 1.5).isActive = true
            braces.heightAnchor.constraint(equalTo: braces.widthAnchor, multiplier: 1.5).isActive = true
            targetView = braces
        }

        if config.contains(.torch) {
            let torch = makeTorchButton()
            torchButton = torch
            view.addSubview(torch)
            view.trailingAnchor.constraint(equalTo: torch.trailingAnchor, constant: 8).isActive = true

            if #available(iOS 11.0, *) {
                view.safeAreaLayoutGuide
                    .bottomAnchor
                    .constraint(equalTo: torch.bottomAnchor, constant: 8)
                    .isActive = true
            } else {
                view.bottomAnchor
                    .constraint(equalTo: torch.bottomAnchor, constant: 8)
                    .isActive = true
            }
        }

        if config.contains(.progressBar) {
            let progressBar = makeProgressBar()
            self.progressBar = progressBar
            view.addSubview(progressBar)
            NSLayoutConstraint.activate([
                progressBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                progressBar.topAnchor.constraint(equalTo: view.topAnchor),
                progressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
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
        targetView.isHidden.toggle()
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
        // swiftlint:disable:next force_unwrapping
        let superview = navigationController?.view ?? view!

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
            generator.impactOccurred()
        }
        let picker = TorchPickerView(frame: view.frame)
        picker.torchLevel = scanner.lastTorchLevel
        picker.frame.origin.y = torchButton.frame.height
        picker.delegate = self
        superview.addSubview(picker)
        picker.frame.origin.x = view.frame.width
        UIView.animate(withDuration: 0.5) {
            picker.frame.origin.x = self.view.frame.width - picker.frame.width
        }
    }
}

extension ScannerViewController: DocumentScannerDelegate {
    public func didCapture(image: UIImage) {
        if let delegate = delegate {
            scanner.pause()
            delegate.scanner(self, didCaptureImage: image)
        }
    }

    public func didRecognize(feature: RectangleFeature?, in image: CIImage) {
        guard let feature = feature else { detectionLayer.path = nil; return }

        detectionLayer.path = feature.bezierPath.cgPath
    }
}

extension ScannerViewController: TorchPickerViewDelegate {
    var lastTorchLevel: Float { return scanner.lastTorchLevel }

    func didPickTorchLevel(_ level: Float) {
        guard level != lastTorchLevel else { return }

        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()

        setTorchUIOn(level != 0)
        scanner.didPickTorchLevel(level)
    }
}
