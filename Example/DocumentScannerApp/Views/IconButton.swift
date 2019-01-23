//
//  IconButton.swift
//  DocumentScannerApp
//
//  Created by Steff Blümm on 01.05.18.
//  Copyright © 2018 adorsys GmbH & Co KG. All rights reserved.
//

import UIKit

@IBDesignable
class IconButton: UIButton {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 280, height: 48)
    }

    var buttonClaim: String = "Call To Action"
    var spacing: CGFloat = 8.0
    var iconSize: CGSize {
        return CGSize.zero
    }

    var drawColour: UIColor = .white
    var adorsysYellow: UIColor {
        return UIColor(red: 0.933, green: 0.837, blue: 0.146, alpha: 1.000)
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
    }

    required init() {

        super.init(frame: .zero)

        // set other operations after super.init, if required
        backgroundColor = .clear
    }

    override init(frame: CGRect) {

        super.init(frame: frame)

        // set other operations after super.init, if required
        backgroundColor = .clear
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {
            if newValue {
                drawColour = adorsysYellow
            } else {
                drawColour = .white
            }
            super.isHighlighted = newValue
            setNeedsDisplay()
        }
    }

    // MARK: Custom Drawing

    override func draw(_: CGRect) {
        guard self.bounds.width > 0 else {
            return
        }

        let smaller = min(self.frame.width, self.frame.height)

        //
        //      Prepare drawing button claim text
        //
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byWordWrapping

        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[.font] = UIFont.systemFont(ofSize: 18)
        attributes[.foregroundColor] = drawColour
        attributes[.paragraphStyle] = paragraph

        //
        //      Calculate offsets & margins
        //
        let claimSize = buttonClaim.size(withAttributes: attributes)
        let contentWidth = iconSize.width + spacing + claimSize.width
        let margin = (self.frame.width - contentWidth) * 0.5
        let xOffset = margin + iconSize.width + spacing
        //        let yOffset = (self.frame.height - smaller) * 0.5

        //
        //      Draw
        //
        buttonClaim.draw(in: CGRect(x: xOffset, y: (self.frame.height - claimSize.height) * 0.5, width: self.frame.width - smaller - 30.0, height: self.frame.height - 4.0), withAttributes: attributes)

        drawIcon(frame: CGRect(x: margin, y: 2, width: iconSize.width, height: iconSize.height), drawColour: drawColour)
    }

    // MARK: Do specific drawing here in sub-class
    func drawIcon(frame: CGRect,
                  borderWidth: CGFloat = 3.0,
                  drawColour: UIColor = .white) {

        // implement this
    }
}
