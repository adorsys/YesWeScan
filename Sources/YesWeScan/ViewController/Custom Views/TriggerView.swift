//
//  TriggerView.swift
//  asserts
//
//  Created by Stefan Haßferter on 18.10.19.
//  Copyright © 2019 STH. All rights reserved.
//

import UIKit
class TriggerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var isHighlighted = false {
        didSet { setNeedsDisplay() }
    }

    override func draw(_ rect: CGRect) {

        let color = UIColor.white
        let gap = rect.width * (isHighlighted ? 0.06 : 0.03)
        let thickness = 0.09 * rect.width
        let center = CGPoint(x: rect.midX, y: rect.midY)

        let path = UIBezierPath(arcCenter: center,
                                radius: rect.midX - thickness / 2,
                                startAngle: 0,
                                endAngle: 2 * .pi,
                                clockwise: true)
        path.lineWidth = thickness
        color.setStroke()
        path.stroke()

        let innerPath = UIBezierPath(arcCenter: center,
                                     radius: rect.midX - gap - thickness,
                                     startAngle: 0,
                                     endAngle: 2 * .pi,
                                     clockwise: true)
        color.setFill()
        innerPath.fill()
    }
}
