//
//  FocusRectView.swift
//  asserts
//
//  Created by Stefan Haßferter on 18.10.19.
//  Copyright © 2019 STH. All rights reserved.
//

import UIKit

class FocusRectView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        let linewidth: CGFloat = 1
        let lineLength = rect.width * 0.1
        let topPoint = CGPoint(x: rect.midX, y: lineLength)
        let topMiddle = CGPoint(x: rect.midX, y: 0)
        let rightPoint = CGPoint(x: rect.width - lineLength, y: rect.midY)
        let rightMiddle = CGPoint(x: rect.width, y: rect.midY)
        let bottomPoint = CGPoint(x: rect.midX, y: rect.height - lineLength)
        let bottomMiddle = CGPoint(x: rect.midX, y: rect.height)
        let leftPoint = CGPoint(x: lineLength, y: rect.midY)
        let leftMiddle = CGPoint(x: 0, y: rect.midY)

        let path = UIBezierPath(rect: rect.insetBy(dx: linewidth / 2,
                                                   dy: linewidth / 2))

        path.move(to: topMiddle)
        path.addLine(to: topPoint)

        path.move(to: rightMiddle)
        path.addLine(to: rightPoint)

        path.move(to: bottomMiddle)
        path.addLine(to: bottomPoint)

        path.move(to: leftMiddle)
        path.addLine(to: leftPoint)

        UIColor.red.setStroke()
        path.lineWidth = linewidth
        path.stroke()
    }
}
