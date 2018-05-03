//
//  EditButton.swift
//  DocumentScannerApp
//
//  Created by Steff Blümm on 30.04.18.
//  Copyright © 2018 Steff Blümm. All rights reserved.
//

import UIKit

@IBDesignable class EditButton: IconButton {
    
    override var iconSize: CGSize {
        return CGSize(width: 58.0, height: 44.0)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        buttonClaim = "Edit Image"
    }
    
    public required init() {
        
        super.init()
        
        // set other operations after super.init, if required
        buttonClaim = "Edit Image"
    }
    
    override func drawIcon(frame: CGRect,
                           borderWidth: CGFloat = 3.0,
                           drawColour: UIColor = .white) {
        
        drawCropIcon(frame: frame, borderWidth: borderWidth, drawColour: drawColour)
    }
    
}

extension EditButton {
    func drawCropIcon(frame: CGRect = CGRect(x: 30, y: 146, width: 58, height: 44),
                      borderWidth: CGFloat = 3,
                      drawColour: UIColor = .white) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        // This non-generic function dramatically improves compilation times of complex expressions.
        func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }
        
        //// Color Declarations
        let paperColour = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.412)
        let paperBorder = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.639)
        
        //// Subframes
        let group: CGRect = CGRect(x: frame.minX + 1, y: frame.minY + 2, width: frame.width - 2, height: frame.height - 5)
        
        
        //// Group
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: group.minX + fastFloor(group.width * 0.00000 + 0.5), y: group.minY + fastFloor(group.height * 0.02564 + 0.5), width: fastFloor(group.width * 1.00000 + 0.5) - fastFloor(group.width * 0.00000 + 0.5), height: fastFloor(group.height * 0.97436 + 0.5) - fastFloor(group.height * 0.02564 + 0.5)))
        paperColour.setFill()
        rectanglePath.fill()
        paperBorder.setStroke()
        rectanglePath.lineWidth = 1
        rectanglePath.stroke()
        
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: group.minX + 0.75001 * group.width, y: group.minY + 0.50002 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.96651 * group.width, y: group.minY + 0.86600 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.53349 * group.width, y: group.minY + 0.86600 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.36918 * group.width, y: group.minY + 0.86550 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.51111 * group.width, y: group.minY + 0.60000 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.59643 * group.width, y: group.minY + 0.75960 * group.height), controlPoint1: CGPoint(x: group.minX + 0.51111 * group.width, y: group.minY + 0.60000 * group.height), controlPoint2: CGPoint(x: group.minX + 0.55688 * group.width, y: group.minY + 0.68561 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.75000 * group.width, y: group.minY + 0.50000 * group.height), controlPoint1: CGPoint(x: group.minX + 0.66035 * group.width, y: group.minY + 0.65154 * group.height), controlPoint2: CGPoint(x: group.minX + 0.75000 * group.width, y: group.minY + 0.50000 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.75001 * group.width, y: group.minY + 0.50002 * group.height))
        bezierPath.close()
        paperColour.setFill()
        bezierPath.fill()
        
        
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: group.minX + fastFloor(group.width * 0.12500 + 0.5), y: group.minY + fastFloor(group.height * 0.17949 + 0.5), width: fastFloor(group.width * 0.30357 + 0.5) - fastFloor(group.width * 0.12500 + 0.5), height: fastFloor(group.height * 0.41026 + 0.5) - fastFloor(group.height * 0.17949 + 0.5)))
        paperColour.setFill()
        ovalPath.fill()
        
        drawColour.setStroke()
        
        //// ScanIndicator
        //// upper left corner Drawing
        let upperLeftCornerPath = UIBezierPath()
        upperLeftCornerPath.move(to: CGPoint(x: group.minX + 0.08929 * group.width, y: group.minY + 0.24742 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.08929 * group.width, y: group.minY + 0.18911 * group.height))
        upperLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.09591 * group.width, y: group.minY + 0.08288 * group.height), controlPoint1: CGPoint(x: group.minX + 0.08929 * group.width, y: group.minY + 0.13466 * group.height), controlPoint2: CGPoint(x: group.minX + 0.08929 * group.width, y: group.minY + 0.10743 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.09686 * group.width, y: group.minY + 0.07812 * group.height))
        upperLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.15313 * group.width, y: group.minY + 0.00927 * group.height), controlPoint1: CGPoint(x: group.minX + 0.10638 * group.width, y: group.minY + 0.04612 * group.height), controlPoint2: CGPoint(x: group.minX + 0.12698 * group.width, y: group.minY + 0.02091 * group.height))
        upperLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.24383 * group.width, y: group.minY + 0.00000 * group.height), controlPoint1: CGPoint(x: group.minX + 0.17708 * group.width, y: group.minY + 0.00000 * group.height), controlPoint2: CGPoint(x: group.minX + 0.19933 * group.width, y: group.minY + 0.00000 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.28306 * group.width, y: group.minY + 0.00000 * group.height))
        upperLeftCornerPath.move(to: CGPoint(x: group.minX + 0.28306 * group.width, y: group.minY + 0.00000 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.30412 * group.width, y: group.minY + 0.00000 * group.height))
        upperLeftCornerPath.move(to: CGPoint(x: group.minX + 0.08929 * group.width, y: group.minY + 0.27835 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.08929 * group.width, y: group.minY + 0.24742 * group.height))
        upperLeftCornerPath.lineWidth = borderWidth
        upperLeftCornerPath.lineCapStyle = .round
        upperLeftCornerPath.stroke()
        
        
        //// upper right corner Drawing
        let upperRightCornerPath = UIBezierPath()
        upperRightCornerPath.move(to: CGPoint(x: group.minX + 0.91071 * group.width, y: group.minY + 0.24742 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.91071 * group.width, y: group.minY + 0.18911 * group.height))
        upperRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.90409 * group.width, y: group.minY + 0.08288 * group.height), controlPoint1: CGPoint(x: group.minX + 0.91071 * group.width, y: group.minY + 0.13466 * group.height), controlPoint2: CGPoint(x: group.minX + 0.91071 * group.width, y: group.minY + 0.10743 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.90314 * group.width, y: group.minY + 0.07812 * group.height))
        upperRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.84687 * group.width, y: group.minY + 0.00927 * group.height), controlPoint1: CGPoint(x: group.minX + 0.89362 * group.width, y: group.minY + 0.04612 * group.height), controlPoint2: CGPoint(x: group.minX + 0.87302 * group.width, y: group.minY + 0.02091 * group.height))
        upperRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.75617 * group.width, y: group.minY + 0.00000 * group.height), controlPoint1: CGPoint(x: group.minX + 0.82292 * group.width, y: group.minY + 0.00000 * group.height), controlPoint2: CGPoint(x: group.minX + 0.80067 * group.width, y: group.minY + 0.00000 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.71694 * group.width, y: group.minY + 0.00000 * group.height))
        upperRightCornerPath.move(to: CGPoint(x: group.minX + 0.71694 * group.width, y: group.minY + 0.00000 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.69588 * group.width, y: group.minY + 0.00000 * group.height))
        upperRightCornerPath.move(to: CGPoint(x: group.minX + 0.91071 * group.width, y: group.minY + 0.27835 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.91071 * group.width, y: group.minY + 0.24742 * group.height))
        upperRightCornerPath.lineWidth = borderWidth
        upperRightCornerPath.lineCapStyle = .round
        upperRightCornerPath.stroke()
        
        
        //// lower left corner Drawing
        let lowerLeftCornerPath = UIBezierPath()
        lowerLeftCornerPath.move(to: CGPoint(x: group.minX + 0.08929 * group.width, y: group.minY + 0.75258 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.08929 * group.width, y: group.minY + 0.81089 * group.height))
        lowerLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.09591 * group.width, y: group.minY + 0.91712 * group.height), controlPoint1: CGPoint(x: group.minX + 0.08929 * group.width, y: group.minY + 0.86534 * group.height), controlPoint2: CGPoint(x: group.minX + 0.08929 * group.width, y: group.minY + 0.89257 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.09686 * group.width, y: group.minY + 0.92188 * group.height))
        lowerLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.15313 * group.width, y: group.minY + 0.99073 * group.height), controlPoint1: CGPoint(x: group.minX + 0.10638 * group.width, y: group.minY + 0.95388 * group.height), controlPoint2: CGPoint(x: group.minX + 0.12698 * group.width, y: group.minY + 0.97909 * group.height))
        lowerLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.24383 * group.width, y: group.minY + 1.00000 * group.height), controlPoint1: CGPoint(x: group.minX + 0.17708 * group.width, y: group.minY + 1.00000 * group.height), controlPoint2: CGPoint(x: group.minX + 0.19933 * group.width, y: group.minY + 1.00000 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.28306 * group.width, y: group.minY + 1.00000 * group.height))
        lowerLeftCornerPath.move(to: CGPoint(x: group.minX + 0.28306 * group.width, y: group.minY + 1.00000 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.30412 * group.width, y: group.minY + 1.00000 * group.height))
        lowerLeftCornerPath.move(to: CGPoint(x: group.minX + 0.08929 * group.width, y: group.minY + 0.72165 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.08929 * group.width, y: group.minY + 0.75258 * group.height))
        lowerLeftCornerPath.lineWidth = borderWidth
        lowerLeftCornerPath.lineCapStyle = .round
        lowerLeftCornerPath.stroke()
        
        
        //// lower right corner Drawing
        let lowerRightCornerPath = UIBezierPath()
        lowerRightCornerPath.move(to: CGPoint(x: group.minX + 0.91071 * group.width, y: group.minY + 0.75258 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.91071 * group.width, y: group.minY + 0.81089 * group.height))
        lowerRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.90409 * group.width, y: group.minY + 0.91712 * group.height), controlPoint1: CGPoint(x: group.minX + 0.91071 * group.width, y: group.minY + 0.86534 * group.height), controlPoint2: CGPoint(x: group.minX + 0.91071 * group.width, y: group.minY + 0.89257 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.90314 * group.width, y: group.minY + 0.92188 * group.height))
        lowerRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.84687 * group.width, y: group.minY + 0.99073 * group.height), controlPoint1: CGPoint(x: group.minX + 0.89362 * group.width, y: group.minY + 0.95388 * group.height), controlPoint2: CGPoint(x: group.minX + 0.87302 * group.width, y: group.minY + 0.97909 * group.height))
        lowerRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.75617 * group.width, y: group.minY + 1.00000 * group.height), controlPoint1: CGPoint(x: group.minX + 0.82292 * group.width, y: group.minY + 1.00000 * group.height), controlPoint2: CGPoint(x: group.minX + 0.80067 * group.width, y: group.minY + 1.00000 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.71694 * group.width, y: group.minY + 1.00000 * group.height))
        lowerRightCornerPath.move(to: CGPoint(x: group.minX + 0.71694 * group.width, y: group.minY + 1.00000 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.69588 * group.width, y: group.minY + 1.00000 * group.height))
        lowerRightCornerPath.move(to: CGPoint(x: group.minX + 0.91071 * group.width, y: group.minY + 0.72165 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.91071 * group.width, y: group.minY + 0.75258 * group.height))
        lowerRightCornerPath.lineWidth = borderWidth
        lowerRightCornerPath.lineCapStyle = .round
        lowerRightCornerPath.stroke()
        
        
        
        
        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: group.minX + 0.15833 * group.width, y: group.minY + 0.90800 * group.height))
        bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.85277 * group.width, y: group.minY + 0.10800 * group.height), controlPoint1: CGPoint(x: group.minX + 0.86393 * group.width, y: group.minY + 0.09514 * group.height), controlPoint2: CGPoint(x: group.minX + 0.85277 * group.width, y: group.minY + 0.10800 * group.height))
        bezier2Path.lineWidth = borderWidth
        context.saveGState()
        context.setLineDash(phase: 13, lengths: [6, 8])
        bezier2Path.stroke()
        context.restoreGState()
    }
}
