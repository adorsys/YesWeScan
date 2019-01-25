//
//  EditButton.swift
//  DocumentScannerApp
//
//  Created by Steff Blümm on 30.04.18.
//  Copyright © 2018 adorsys GmbH & Co KG. All rights reserved.
//

import UIKit

class EditButton: IconButton {
    override var iconSize: CGSize {
        return CGSize(width: 58.0, height: 44.0)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        buttonClaim = "Edit Image"
    }

    public required init() {
        super.init()

        buttonClaim = "Edit Image"
    }

    override func drawIcon(frame: CGRect,
                           borderWidth: CGFloat = 3.0,
                           drawColour: UIColor = .white) {

        drawCropIcon(frame: frame,
                     borderWidth: borderWidth,
                     drawColour: drawColour)
    }
}

extension EditButton {
    // swiftlint:disable line_length
    func drawCropIcon(frame: CGRect,
                      borderWidth: CGFloat,
                      drawColour: UIColor) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        // This non-generic function dramatically improves compilation times of complex expressions.
        func fastFloor(_ x: CGFloat) -> CGFloat { return floor(x) }

        //// Color Declarations
        let paperColour = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.412)
        let paperBorder = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.639)

        //// Subframes
        let group: CGRect = CGRect(x: frame.minX + 1, y: frame.minY + 2, width: frame.width - 2, height: frame.height - 5)

        //// Group
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: group.minX + fastFloor(group.width * 0.000_00 + 0.5), y: group.minY + fastFloor(group.height * 0.025_64 + 0.5), width: fastFloor(group.width * 1.000_00 + 0.5) - fastFloor(group.width * 0.000_00 + 0.5), height: fastFloor(group.height * 0.974_36 + 0.5) - fastFloor(group.height * 0.025_64 + 0.5)))
        paperColour.setFill()
        rectanglePath.fill()
        paperBorder.setStroke()
        rectanglePath.lineWidth = 1
        rectanglePath.stroke()

        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: group.minX + 0.750_01 * group.width, y: group.minY + 0.500_02 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.966_51 * group.width, y: group.minY + 0.866_00 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.533_49 * group.width, y: group.minY + 0.866_00 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.369_18 * group.width, y: group.minY + 0.865_50 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.511_11 * group.width, y: group.minY + 0.600_00 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.596_43 * group.width, y: group.minY + 0.759_60 * group.height), controlPoint1: CGPoint(x: group.minX + 0.511_11 * group.width, y: group.minY + 0.600_00 * group.height), controlPoint2: CGPoint(x: group.minX + 0.556_88 * group.width, y: group.minY + 0.685_61 * group.height))
        bezierPath.addCurve(to: CGPoint(x: group.minX + 0.750_00 * group.width, y: group.minY + 0.500_00 * group.height), controlPoint1: CGPoint(x: group.minX + 0.660_35 * group.width, y: group.minY + 0.651_54 * group.height), controlPoint2: CGPoint(x: group.minX + 0.750_00 * group.width, y: group.minY + 0.500_00 * group.height))
        bezierPath.addLine(to: CGPoint(x: group.minX + 0.750_01 * group.width, y: group.minY + 0.500_02 * group.height))
        bezierPath.close()
        paperColour.setFill()
        bezierPath.fill()

        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: group.minX + fastFloor(group.width * 0.125_00 + 0.5), y: group.minY + fastFloor(group.height * 0.179_49 + 0.5), width: fastFloor(group.width * 0.303_57 + 0.5) - fastFloor(group.width * 0.125_00 + 0.5), height: fastFloor(group.height * 0.410_26 + 0.5) - fastFloor(group.height * 0.179_49 + 0.5)))
        paperColour.setFill()
        ovalPath.fill()

        drawColour.setStroke()

        //// ScanIndicator
        //// upper left corner Drawing
        let upperLeftCornerPath = UIBezierPath()
        upperLeftCornerPath.move(to: CGPoint(x: group.minX + 0.089_29 * group.width, y: group.minY + 0.247_42 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.089_29 * group.width, y: group.minY + 0.189_11 * group.height))
        upperLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.095_91 * group.width, y: group.minY + 0.082_88 * group.height), controlPoint1: CGPoint(x: group.minX + 0.089_29 * group.width, y: group.minY + 0.134_66 * group.height), controlPoint2: CGPoint(x: group.minX + 0.089_29 * group.width, y: group.minY + 0.107_43 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.096_86 * group.width, y: group.minY + 0.078_12 * group.height))
        upperLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.153_13 * group.width, y: group.minY + 0.009_27 * group.height), controlPoint1: CGPoint(x: group.minX + 0.106_38 * group.width, y: group.minY + 0.046_12 * group.height), controlPoint2: CGPoint(x: group.minX + 0.126_98 * group.width, y: group.minY + 0.020_91 * group.height))
        upperLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.243_83 * group.width, y: group.minY + 0.000_00 * group.height), controlPoint1: CGPoint(x: group.minX + 0.177_08 * group.width, y: group.minY + 0.000_00 * group.height), controlPoint2: CGPoint(x: group.minX + 0.199_33 * group.width, y: group.minY + 0.000_00 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.283_06 * group.width, y: group.minY + 0.000_00 * group.height))
        upperLeftCornerPath.move(to: CGPoint(x: group.minX + 0.283_06 * group.width, y: group.minY + 0.000_00 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.304_12 * group.width, y: group.minY + 0.000_00 * group.height))
        upperLeftCornerPath.move(to: CGPoint(x: group.minX + 0.089_29 * group.width, y: group.minY + 0.278_35 * group.height))
        upperLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.089_29 * group.width, y: group.minY + 0.247_42 * group.height))
        upperLeftCornerPath.lineWidth = borderWidth
        upperLeftCornerPath.lineCapStyle = .round
        upperLeftCornerPath.stroke()

        //// upper right corner Drawing
        let upperRightCornerPath = UIBezierPath()
        upperRightCornerPath.move(to: CGPoint(x: group.minX + 0.910_71 * group.width, y: group.minY + 0.247_42 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.910_71 * group.width, y: group.minY + 0.189_11 * group.height))
        upperRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.904_09 * group.width, y: group.minY + 0.082_88 * group.height), controlPoint1: CGPoint(x: group.minX + 0.910_71 * group.width, y: group.minY + 0.134_66 * group.height), controlPoint2: CGPoint(x: group.minX + 0.910_71 * group.width, y: group.minY + 0.107_43 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.903_14 * group.width, y: group.minY + 0.078_12 * group.height))
        upperRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.846_87 * group.width, y: group.minY + 0.009_27 * group.height), controlPoint1: CGPoint(x: group.minX + 0.893_62 * group.width, y: group.minY + 0.046_12 * group.height), controlPoint2: CGPoint(x: group.minX + 0.873_02 * group.width, y: group.minY + 0.020_91 * group.height))
        upperRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.756_17 * group.width, y: group.minY + 0.000_00 * group.height), controlPoint1: CGPoint(x: group.minX + 0.822_92 * group.width, y: group.minY + 0.000_00 * group.height), controlPoint2: CGPoint(x: group.minX + 0.800_67 * group.width, y: group.minY + 0.000_00 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.716_94 * group.width, y: group.minY + 0.000_00 * group.height))
        upperRightCornerPath.move(to: CGPoint(x: group.minX + 0.716_94 * group.width, y: group.minY + 0.000_00 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.695_88 * group.width, y: group.minY + 0.000_00 * group.height))
        upperRightCornerPath.move(to: CGPoint(x: group.minX + 0.910_71 * group.width, y: group.minY + 0.278_35 * group.height))
        upperRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.910_71 * group.width, y: group.minY + 0.247_42 * group.height))
        upperRightCornerPath.lineWidth = borderWidth
        upperRightCornerPath.lineCapStyle = .round
        upperRightCornerPath.stroke()

        //// lower left corner Drawing
        let lowerLeftCornerPath = UIBezierPath()
        lowerLeftCornerPath.move(to: CGPoint(x: group.minX + 0.089_29 * group.width, y: group.minY + 0.752_58 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.089_29 * group.width, y: group.minY + 0.810_89 * group.height))
        lowerLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.095_91 * group.width, y: group.minY + 0.917_12 * group.height), controlPoint1: CGPoint(x: group.minX + 0.089_29 * group.width, y: group.minY + 0.865_34 * group.height), controlPoint2: CGPoint(x: group.minX + 0.089_29 * group.width, y: group.minY + 0.892_57 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.096_86 * group.width, y: group.minY + 0.921_88 * group.height))
        lowerLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.153_13 * group.width, y: group.minY + 0.990_73 * group.height), controlPoint1: CGPoint(x: group.minX + 0.106_38 * group.width, y: group.minY + 0.953_88 * group.height), controlPoint2: CGPoint(x: group.minX + 0.126_98 * group.width, y: group.minY + 0.979_09 * group.height))
        lowerLeftCornerPath.addCurve(to: CGPoint(x: group.minX + 0.243_83 * group.width, y: group.minY + 1.000_00 * group.height), controlPoint1: CGPoint(x: group.minX + 0.177_08 * group.width, y: group.minY + 1.000_00 * group.height), controlPoint2: CGPoint(x: group.minX + 0.199_33 * group.width, y: group.minY + 1.000_00 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.283_06 * group.width, y: group.minY + 1.000_00 * group.height))
        lowerLeftCornerPath.move(to: CGPoint(x: group.minX + 0.283_06 * group.width, y: group.minY + 1.000_00 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.304_12 * group.width, y: group.minY + 1.000_00 * group.height))
        lowerLeftCornerPath.move(to: CGPoint(x: group.minX + 0.089_29 * group.width, y: group.minY + 0.721_65 * group.height))
        lowerLeftCornerPath.addLine(to: CGPoint(x: group.minX + 0.089_29 * group.width, y: group.minY + 0.752_58 * group.height))
        lowerLeftCornerPath.lineWidth = borderWidth
        lowerLeftCornerPath.lineCapStyle = .round
        lowerLeftCornerPath.stroke()

        //// lower right corner Drawing
        let lowerRightCornerPath = UIBezierPath()
        lowerRightCornerPath.move(to: CGPoint(x: group.minX + 0.910_71 * group.width, y: group.minY + 0.752_58 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.910_71 * group.width, y: group.minY + 0.810_89 * group.height))
        lowerRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.904_09 * group.width, y: group.minY + 0.917_12 * group.height), controlPoint1: CGPoint(x: group.minX + 0.910_71 * group.width, y: group.minY + 0.865_34 * group.height), controlPoint2: CGPoint(x: group.minX + 0.910_71 * group.width, y: group.minY + 0.892_57 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.903_14 * group.width, y: group.minY + 0.921_88 * group.height))
        lowerRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.846_87 * group.width, y: group.minY + 0.990_73 * group.height), controlPoint1: CGPoint(x: group.minX + 0.893_62 * group.width, y: group.minY + 0.953_88 * group.height), controlPoint2: CGPoint(x: group.minX + 0.873_02 * group.width, y: group.minY + 0.979_09 * group.height))
        lowerRightCornerPath.addCurve(to: CGPoint(x: group.minX + 0.756_17 * group.width, y: group.minY + 1.000_00 * group.height), controlPoint1: CGPoint(x: group.minX + 0.822_92 * group.width, y: group.minY + 1.000_00 * group.height), controlPoint2: CGPoint(x: group.minX + 0.800_67 * group.width, y: group.minY + 1.000_00 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.716_94 * group.width, y: group.minY + 1.000_00 * group.height))
        lowerRightCornerPath.move(to: CGPoint(x: group.minX + 0.716_94 * group.width, y: group.minY + 1.000_00 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.695_88 * group.width, y: group.minY + 1.000_00 * group.height))
        lowerRightCornerPath.move(to: CGPoint(x: group.minX + 0.910_71 * group.width, y: group.minY + 0.721_65 * group.height))
        lowerRightCornerPath.addLine(to: CGPoint(x: group.minX + 0.910_71 * group.width, y: group.minY + 0.752_58 * group.height))
        lowerRightCornerPath.lineWidth = borderWidth
        lowerRightCornerPath.lineCapStyle = .round
        lowerRightCornerPath.stroke()

        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: group.minX + 0.158_33 * group.width, y: group.minY + 0.908_00 * group.height))
        bezier2Path.addCurve(to: CGPoint(x: group.minX + 0.852_77 * group.width, y: group.minY + 0.108_00 * group.height), controlPoint1: CGPoint(x: group.minX + 0.863_93 * group.width, y: group.minY + 0.095_14 * group.height), controlPoint2: CGPoint(x: group.minX + 0.852_77 * group.width, y: group.minY + 0.108_00 * group.height))
        bezier2Path.lineWidth = borderWidth
        context?.saveGState()
        context?.setLineDash(phase: 13, lengths: [6, 8])
        bezier2Path.stroke()
        context?.restoreGState()
    }
    // swiftlint:enable line_length
}
