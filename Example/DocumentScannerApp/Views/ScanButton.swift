//
//  ScanButton.swift
//  DocumentScannerApp
//
//  Created by Steff Blümm on 30.04.18.
//  Copyright © 2018 Steff Blümm. All rights reserved.
//

import UIKit

@IBDesignable
class ScanButton: IconButton {

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
        rectanglePath.move(to: CGPoint(x: group.minX + 0.012_50 * group.width, y: group.minY + 0.893_50 * group.height))
        rectanglePath.addLine(to: CGPoint(x: group.minX + 0.812_56 * group.width, y: group.minY + 1.000_00 * group.height))
        rectanglePath.addLine(to: CGPoint(x: group.minX + 0.876_19 * group.width, y: group.minY + 0.150_03 * group.height))
        rectanglePath.addLine(to: CGPoint(x: group.minX + 0.325_60 * group.width, y: group.minY + 0.087_60 * group.height))
        rectanglePath.addLine(to: CGPoint(x: group.minX + 0.012_50 * group.width, y: group.minY + 0.893_50 * group.height))
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
        upperLeftCornerPath.move(to: CGPoint(x: group.minX + 0.000_00 * group.width, y: group.minY + 0.222_93 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.000_00 * group.width, y: group.minY + 0.170_39 * group.height))
        upperLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.008_06 * group.width, y: group.minY + 0.074_67 * group.height), controlPoint1: CGPoint(x: group.minX + 0.000_00 * group.width, y: group.minY + 0.121_33 * group.height), controlPoint2: CGPoint(x: group.minX + 0.000_00 * group.width, y: group.minY + 0.096_80 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.009_22 * group.width, y: group.minY + 0.070_39 * group.height))
        upperLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.077_72 * group.width, y: group.minY + 0.008_35 * group.height), controlPoint1: CGPoint(x: group.minX + 0.020_81 * group.width, y: group.minY + 0.041_56 * group.height), controlPoint2: CGPoint(x: group.minX + 0.045_89 * group.width, y: group.minY + 0.018_84 * group.height))
        upperLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.188_14 * group.width, y: group.minY + 0.000_00 * group.height), controlPoint1: CGPoint(x: group.minX + 0.106_88 * group.width, y: group.minY + -0.000_00 * group.height), controlPoint2: CGPoint(x: group.minX + 0.133_97 * group.width, y: group.minY + 0.000_00 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.235_90 * group.width, y: group.minY + 0.000_00 * group.height))
        upperLeftCornerPath.move(to: CGPoint(x: group.minX + 0.235_90 * group.width, y: group.minY + 0.000_00 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.261_54 * group.width, y: group.minY + 0.000_00 * group.height))
        upperLeftCornerPath.move(to: CGPoint(x: group.minX + 0.000_00 * group.width, y: group.minY + 0.250_80 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.000_00 * group.width, y: group.minY + 0.222_93 * group.height))
        upperLeftCornerPath.lineWidth = borderWidth
        upperLeftCornerPath.lineCapStyle = .round
        upperLeftCornerPath.stroke()

        //// upper right corner Drawing
        let upperRightCornerPath = UIBezierPath()
        upperRightCornerPath.move(to: CGPoint(x: group.minX + 1.000_00 * group.width, y: group.minY + 0.222_93 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 1.000_00 * group.width, y: group.minY + 0.170_39 * group.height))
        upperRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.991_94 * group.width, y: group.minY + 0.074_67 * group.height), controlPoint1: CGPoint(x: group.minX + 1.000_00 * group.width, y: group.minY + 0.121_33 * group.height), controlPoint2: CGPoint(x: group.minX + 1.000_00 * group.width, y: group.minY + 0.096_80 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.990_78 * group.width, y: group.minY + 0.070_39 * group.height))
        upperRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.922_28 * group.width, y: group.minY + 0.008_35 * group.height), controlPoint1: CGPoint(x: group.minX + 0.979_19 * group.width, y: group.minY + 0.041_56 * group.height), controlPoint2: CGPoint(x: group.minX + 0.954_11 * group.width, y: group.minY + 0.018_84 * group.height))
        upperRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.811_86 * group.width, y: group.minY + 0.000_00 * group.height), controlPoint1: CGPoint(x: group.minX + 0.893_12 * group.width, y: group.minY + -0.000_00 * group.height), controlPoint2: CGPoint(x: group.minX + 0.866_03 * group.width, y: group.minY + 0.000_00 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.764_10 * group.width, y: group.minY + 0.000_00 * group.height))
        upperRightCornerPath.move(to: CGPoint(x: group.minX + 0.764_10 * group.width, y: group.minY + 0.000_00 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.738_46 * group.width, y: group.minY + 0.000_00 * group.height))
        upperRightCornerPath.move(to: CGPoint(x: group.minX + 1.000_00 * group.width, y: group.minY + 0.250_80 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 1.000_00 * group.width, y: group.minY + 0.222_93 * group.height))
        upperRightCornerPath.lineWidth = borderWidth
        upperRightCornerPath.lineCapStyle = .round
        upperRightCornerPath.stroke()

        //// lower left corner Drawing
        let lowerLeftCornerPath = UIBezierPath()
        lowerLeftCornerPath.move(to: CGPoint(x: group.minX + 0.000_00 * group.width, y: group.minY + 0.678_08 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.000_00 * group.width, y: group.minY + 0.730_62 * group.height))
        lowerLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.008_06 * group.width, y: group.minY + 0.826_34 * group.height), controlPoint1: CGPoint(x: group.minX + 0.000_00 * group.width, y: group.minY + 0.779_68 * group.height), controlPoint2: CGPoint(x: group.minX + 0.000_00 * group.width, y: group.minY + 0.804_21 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.009_22 * group.width, y: group.minY + 0.830_62 * group.height))
        lowerLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.077_72 * group.width, y: group.minY + 0.892_66 * group.height), controlPoint1: CGPoint(x: group.minX + 0.020_81 * group.width, y: group.minY + 0.859_45 * group.height), controlPoint2: CGPoint(x: group.minX + 0.045_89 * group.width, y: group.minY + 0.882_17 * group.height))
        lowerLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.188_14 * group.width, y: group.minY + 0.901_01 * group.height), controlPoint1: CGPoint(x: group.minX + 0.106_88 * group.width, y: group.minY + 0.901_01 * group.height), controlPoint2: CGPoint(x: group.minX + 0.133_97 * group.width, y: group.minY + 0.901_01 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.235_90 * group.width, y: group.minY + 0.901_01 * group.height))
        lowerLeftCornerPath.move(to: CGPoint(x: group.minX + 0.235_90 * group.width, y: group.minY + 0.901_01 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.261_54 * group.width, y: group.minY + 0.901_01 * group.height))
        lowerLeftCornerPath.move(to: CGPoint(x: group.minX + 0.000_00 * group.width, y: group.minY + 0.650_21 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.000_00 * group.width, y: group.minY + 0.678_08 * group.height))
        lowerLeftCornerPath.lineWidth = borderWidth
        lowerLeftCornerPath.lineCapStyle = .round
        lowerLeftCornerPath.stroke()

        //// lower right corner Drawing
        let lowerRightCornerPath = UIBezierPath()
        lowerRightCornerPath.move(to: CGPoint(x: group.minX + 1.000_00 * group.width, y: group.minY + 0.678_08 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 1.000_00 * group.width, y: group.minY + 0.730_62 * group.height))
        lowerRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.991_94 * group.width, y: group.minY + 0.826_34 * group.height), controlPoint1: CGPoint(x: group.minX + 1.000_00 * group.width, y: group.minY + 0.779_68 * group.height), controlPoint2: CGPoint(x: group.minX + 1.000_00 * group.width, y: group.minY + 0.804_21 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.990_78 * group.width, y: group.minY + 0.830_62 * group.height))
        lowerRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.922_28 * group.width, y: group.minY + 0.892_66 * group.height), controlPoint1: CGPoint(x: group.minX + 0.979_19 * group.width, y: group.minY + 0.859_45 * group.height), controlPoint2: CGPoint(x: group.minX + 0.954_11 * group.width, y: group.minY + 0.882_17 * group.height))
        lowerRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.811_86 * group.width, y: group.minY + 0.901_01 * group.height), controlPoint1: CGPoint(x: group.minX + 0.893_12 * group.width, y: group.minY + 0.901_01 * group.height), controlPoint2: CGPoint(x: group.minX + 0.866_03 * group.width, y: group.minY + 0.901_01 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.764_10 * group.width, y: group.minY + 0.901_01 * group.height))
        lowerRightCornerPath.move(to: CGPoint(x: group.minX + 0.764_10 * group.width, y: group.minY + 0.901_01 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.738_46 * group.width, y: group.minY + 0.901_01 * group.height))
        lowerRightCornerPath.move(to: CGPoint(x: group.minX + 1.000_00 * group.width, y: group.minY + 0.650_21 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 1.000_00 * group.width, y: group.minY + 0.678_08 * group.height))
        lowerRightCornerPath.lineWidth = borderWidth
        lowerRightCornerPath.lineCapStyle = .round
        lowerRightCornerPath.stroke()
    }
}
