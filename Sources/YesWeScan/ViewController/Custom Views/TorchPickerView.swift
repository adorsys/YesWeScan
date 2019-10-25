//
//  TorchPickerView.swift
//  DocumentScanner
//
//  Created by Xaver Lohmueller on 25.09.17.
//

import UIKit

protocol TorchPickerViewDelegate: AnyObject {
    var lastTorchLevel: Float { get }

    func toggleTorch()
    func didPickTorchLevel(_ level: Float)
}

final class TorchPickerView: UIView {

    weak var delegate: TorchPickerViewDelegate?
    var torchLevel: Float = 0 {
        didSet {
            let index: Int
            // swiftlint:disable switch_case_on_newline
            switch torchLevel {
            case 0:     index = 4
            case 0.25:  index = 3
            case 0.5:   index = 2
            case 0.75:  index = 1
            default:    index = 0
            }
            // swiftlint:enable switch_case_on_newline
            updateTorchLevels(index: index)
        }
    }
    @IBOutlet private weak var stackView: UIStackView!

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)

        let stackBackgroundView = makeStackView()
        stackView = stackBackgroundView.subviews.first as? UIStackView
        addSubview(stackBackgroundView)

        let tapToDismiss = UITapGestureRecognizer(target: self, action: #selector(removeFromSuperview))
        addGestureRecognizer(tapToDismiss)

        for gesture in stackBackgroundView.gestureRecognizers ?? [] {
            tapToDismiss.require(toFail: gesture)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    private func setupBlurIfNeeded() -> UIVisualEffectView? {
        guard !UIAccessibility.isReduceTransparencyEnabled
            else { backgroundColor = .black; return nil }

        backgroundColor = .clear

        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = frame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addSubview(blurEffectView)

        return blurEffectView
    }

    private func makeStackView() -> UIView {
        let buttons: [UIView] = Array(AnyIterator {
            let view = UIView()
            view.backgroundColor = .clear
            return view
        }.prefix(5))
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.arrangedSubviews.last?.backgroundColor = .clear
        stackView.isUserInteractionEnabled = false

        zip(stackView.arrangedSubviews, stackView.arrangedSubviews.dropFirst())
            .forEach { button1, button2 in
                button1.widthAnchor.constraint(equalTo: button2.widthAnchor).isActive = true
                button1.heightAnchor.constraint(equalTo: button2.heightAnchor).isActive = true
            }

        let view = UIView()
        view.isUserInteractionEnabled = true
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 240)
        view.backgroundColor = .clear
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        if #available(iOS 11.0, *) {
            view.layer.maskedCorners = [.layerMinXMaxYCorner,
                                        .layerMinXMinYCorner,
                                        .layerMaxXMaxYCorner,
                                        .layerMaxXMinYCorner]
        }
        stackView.frame = view.frame
        view.addSubview(stackView)
        view.center.y = center.y
        view.frame.origin.x = frame.width - view.frame.width

        let action = #selector(didPan)
        let pan = UIPanGestureRecognizer(target: self, action: action)
        view.addGestureRecognizer(pan)
        let tap = UITapGestureRecognizer(target: self, action: action)
        view.addGestureRecognizer(tap)

        return view
    }

    @objc
    private func didPan(_ sender: UIPanGestureRecognizer) {
        guard let view = sender.view else { return }
        let yCoord = sender.location(in: view).y
        let percentage = yCoord / view.bounds.height

        let index: Int
        // swiftlint:disable switch_case_on_newline
        switch percentage {
        case ...0.2:    index = 0
        case ...0.4:    index = 1
        case ...0.6:    index = 2
        case ...0.8:    index = 3
        default:        index = 4
        }
        // swiftlint:enable switch_case_on_newline
        updateTorchLevels(index: index)

        delegate?.didPickTorchLevel(1 - Float(index) * 0.25)
    }

    private func updateTorchLevels(index: Int) {

        for view in stackView.arrangedSubviews[...index] {
            view.backgroundColor = UIColor(white: 0.7, alpha: 0.45)
        }
        for view in stackView.arrangedSubviews[index...] {
            view.backgroundColor = UIColor(white: 1.0, alpha: 0.65)
        }
        stackView.arrangedSubviews.last?.backgroundColor = UIColor(white: 0.7, alpha: 0.85)
    }

    @objc
    override func removeFromSuperview() {

        UIView.animate(withDuration: 0.5,
                       animations: {
            self.frame.origin.x += self.stackView.frame.width
        }, completion: { completed in
            if completed {
                super.removeFromSuperview()
            }
        })
    }
}
