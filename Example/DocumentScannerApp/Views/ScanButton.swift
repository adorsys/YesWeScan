//
//  ScanButton.swift
//  DocumentScannerApp
//
//  Created by Steff Blümm on 30.04.18.
//  Copyright © 2018 Steff Blümm. All rights reserved.
//

import UIKit

@IBDesignable class ScanButton: IconButton {
    
    override var iconSize: CGSize {
        return CGSize(width: 44.0, height: 43.0)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        buttonClaim = "Scan Document"
    }
    
    public required init() {
        
        super.init()
        
        // set other operations after super.init, if required
        backgroundColor = .clear
        
        buttonClaim = "Scan Document"
    }
    
    override func drawIcon(frame: CGRect,
                           borderWidth: CGFloat = 3.0,
                           drawColour: UIColor = .white) {
        
        drawScanIcon(frame: frame, borderWidth: borderWidth, drawColour: drawColour)
    }
    
}

extension ScanButton {
    func drawScanIcon(frame: CGRect = CGRect(x: 2, y: 2, width: 44, height: 43),
                      borderWidth: CGFloat = 3,
                      drawColour: UIColor = .white) {
        //// Color Declarations
        let paperColour = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.412)
        let paperBorder = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.639)
        
        //// Subframes
        let group: CGRect = CGRect(x: frame.minX + 2, y: frame.minY + 2, width: frame.width - 4, height: frame.height - 3.04)
        
        
        //// Group
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath()
        rectanglePath.move(to: CGPoint(x: group.minX + 0.01250 * group.width, y: group.minY + 0.89350 * group.height))
        rectanglePath.addLine(to: CGPoint(x: group.minX + 0.81256 * group.width, y: group.minY + 1.00000 * group.height))
        rectanglePath.addLine(to: CGPoint(x: group.minX + 0.87619 * group.width, y: group.minY + 0.15003 * group.height))
        rectanglePath.addLine(to: CGPoint(x: group.minX + 0.32560 * group.width, y: group.minY + 0.08760 * group.height))
        rectanglePath.addLine(to: CGPoint(x: group.minX + 0.01250 * group.width, y: group.minY + 0.89350 * group.height))
        rectanglePath.close()
        paperColour.setFill()
        rectanglePath.fill()
        paperBorder.setStroke()
        rectanglePath.lineWidth = 1
        rectanglePath.stroke()
        
        drawColour.setStroke()
        
        //// ScanIndicator
        //// upper left corner Drawing
        let upperLeftCornerPath = UIBezierPath()
        upperLeftCornerPath.move(to: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.22293 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.17039 * group.height))
        upperLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.00806 * group.width, y: group.minY + 0.07467 * group.height), controlPoint1: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.12133 * group.height), controlPoint2: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.09680 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.00922 * group.width, y: group.minY + 0.07039 * group.height))
        upperLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.07772 * group.width, y: group.minY + 0.00835 * group.height), controlPoint1: CGPoint(x: group.minX + 0.02081 * group.width, y: group.minY + 0.04156 * group.height), controlPoint2: CGPoint(x: group.minX + 0.04589 * group.width, y: group.minY + 0.01884 * group.height))
        upperLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.18814 * group.width, y: group.minY + 0.00000 * group.height), controlPoint1: CGPoint(x: group.minX + 0.10688 * group.width, y: group.minY + -0.00000 * group.height), controlPoint2: CGPoint(x: group.minX + 0.13397 * group.width, y: group.minY + 0.00000 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.23590 * group.width, y: group.minY + 0.00000 * group.height))
        upperLeftCornerPath.move(to: CGPoint(x: group.minX + 0.23590 * group.width, y: group.minY + 0.00000 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.26154 * group.width, y: group.minY + 0.00000 * group.height))
        upperLeftCornerPath.move(to: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.25080 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.22293 * group.height))
        upperLeftCornerPath.lineWidth = borderWidth
        upperLeftCornerPath.lineCapStyle = .round
        upperLeftCornerPath.stroke()
        
        
        //// upper right corner Drawing
        let upperRightCornerPath = UIBezierPath()
        upperRightCornerPath.move(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.22293 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.17039 * group.height))
        upperRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.99194 * group.width, y: group.minY + 0.07467 * group.height), controlPoint1: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.12133 * group.height), controlPoint2: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.09680 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.99078 * group.width, y: group.minY + 0.07039 * group.height))
        upperRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.92228 * group.width, y: group.minY + 0.00835 * group.height), controlPoint1: CGPoint(x: group.minX + 0.97919 * group.width, y: group.minY + 0.04156 * group.height), controlPoint2: CGPoint(x: group.minX + 0.95411 * group.width, y: group.minY + 0.01884 * group.height))
        upperRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.81186 * group.width, y: group.minY + 0.00000 * group.height), controlPoint1: CGPoint(x: group.minX + 0.89312 * group.width, y: group.minY + -0.00000 * group.height), controlPoint2: CGPoint(x: group.minX + 0.86603 * group.width, y: group.minY + 0.00000 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.76410 * group.width, y: group.minY + 0.00000 * group.height))
        upperRightCornerPath.move(to: CGPoint(x: group.minX + 0.76410 * group.width, y: group.minY + 0.00000 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.73846 * group.width, y: group.minY + 0.00000 * group.height))
        upperRightCornerPath.move(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.25080 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.22293 * group.height))
        upperRightCornerPath.lineWidth = borderWidth
        upperRightCornerPath.lineCapStyle = .round
        upperRightCornerPath.stroke()
        
        
        //// lower left corner Drawing
        let lowerLeftCornerPath = UIBezierPath()
        lowerLeftCornerPath.move(to: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.67808 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.73062 * group.height))
        lowerLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.00806 * group.width, y: group.minY + 0.82634 * group.height), controlPoint1: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.77968 * group.height), controlPoint2: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.80421 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.00922 * group.width, y: group.minY + 0.83062 * group.height))
        lowerLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.07772 * group.width, y: group.minY + 0.89266 * group.height), controlPoint1: CGPoint(x: group.minX + 0.02081 * group.width, y: group.minY + 0.85945 * group.height), controlPoint2: CGPoint(x: group.minX + 0.04589 * group.width, y: group.minY + 0.88217 * group.height))
        lowerLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.18814 * group.width, y: group.minY + 0.90101 * group.height), controlPoint1: CGPoint(x: group.minX + 0.10688 * group.width, y: group.minY + 0.90101 * group.height), controlPoint2: CGPoint(x: group.minX + 0.13397 * group.width, y: group.minY + 0.90101 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.23590 * group.width, y: group.minY + 0.90101 * group.height))
        lowerLeftCornerPath.move(to: CGPoint(x: group.minX + 0.23590 * group.width, y: group.minY + 0.90101 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.26154 * group.width, y: group.minY + 0.90101 * group.height))
        lowerLeftCornerPath.move(to: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.65021 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.00000 * group.width, y: group.minY + 0.67808 * group.height))
        lowerLeftCornerPath.lineWidth = borderWidth
        lowerLeftCornerPath.lineCapStyle = .round
        lowerLeftCornerPath.stroke()
        
        
        //// lower right corner Drawing
        let lowerRightCornerPath = UIBezierPath()
        lowerRightCornerPath.move(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.67808 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.73062 * group.height))
        lowerRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.99194 * group.width, y: group.minY + 0.82634 * group.height), controlPoint1: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.77968 * group.height), controlPoint2: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.80421 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.99078 * group.width, y: group.minY + 0.83062 * group.height))
        lowerRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.92228 * group.width, y: group.minY + 0.89266 * group.height), controlPoint1: CGPoint(x: group.minX + 0.97919 * group.width, y: group.minY + 0.85945 * group.height), controlPoint2: CGPoint(x: group.minX + 0.95411 * group.width, y: group.minY + 0.88217 * group.height))
        lowerRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.81186 * group.width, y: group.minY + 0.90101 * group.height), controlPoint1: CGPoint(x: group.minX + 0.89312 * group.width, y: group.minY + 0.90101 * group.height), controlPoint2: CGPoint(x: group.minX + 0.86603 * group.width, y: group.minY + 0.90101 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.76410 * group.width, y: group.minY + 0.90101 * group.height))
        lowerRightCornerPath.move(to: CGPoint(x: group.minX + 0.76410 * group.width, y: group.minY + 0.90101 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.73846 * group.width, y: group.minY + 0.90101 * group.height))
        lowerRightCornerPath.move(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.65021 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 1.00000 * group.width, y: group.minY + 0.67808 * group.height))
        lowerRightCornerPath.lineWidth = borderWidth
        lowerRightCornerPath.lineCapStyle = .round
        lowerRightCornerPath.stroke()
    }
}
