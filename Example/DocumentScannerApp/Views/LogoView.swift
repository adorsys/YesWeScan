//
//  LogoView.swift
//  DocumentScannerApp
//
//  Created by Steff Blümm on 30.04.18.
//  Copyright © 2018 adorsys GmbH & Co KG. All rights reserved.
//

import UIKit

@IBDesignable
// swiftlint:disable:next type_body_length
class LogoView: UIView {

    private var adorsysDarkBlue: UIColor {
        return UIColor(red: 0.000, green: 0.352, blue: 0.484, alpha: 1.000)
    }

    private var white: UIColor {
        return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.000)
    }

    private var factor: CGFloat {
        return 63.0 / 397.0
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        backgroundColor = .clear
    }

    required init() {

        super.init(frame: .zero)

        // set other operations after super.init, if required
        backgroundColor = .clear
    }

    required override init(frame: CGRect) {

        super.init(frame: frame)

        // set other operations after super.init, if required
        backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        guard bounds.width > 0 else {
            return
        }

        let frameWidth = frame.width
        let frameHeight = frame.height

        guard (frameHeight / frameWidth) >= factor else {
            debugPrint("ratio is to small \(frameHeight / frameWidth) vs \(factor)")
            return
        }

        let requestedHeight = height(from: frameWidth)

        let ymargin = (frameHeight - requestedHeight) * 0.5

        drawLogo(frame: CGRect(x: 0.0, y: ymargin, width: frameWidth, height: requestedHeight), colour: white)
    }

    private func height(from width: CGFloat) -> CGFloat {
        return width * factor
    }

    private func width(from height: CGFloat) -> CGFloat {
        return height * (397.0 / 63.0)
    }

    // swiftlint:disable line_length
    // swiftlint:disable function_body_length
    func drawLogo(frame: CGRect = CGRect(x: 0, y: 0, width: 397, height: 63),
                  colour: UIColor) {
        //// Color Declarations
        let adorsysBlueDark = colour

        //// Subframes
        let logoletters: CGRect = CGRect(x: frame.minX, y: frame.minY, width: frame.width - 0.22, height: frame.height - 0.01)

        //// logo-letters
        //// a-letter Drawing
        let aletterPath = UIBezierPath()
        aletterPath.move(to: CGPoint(x: logoletters.minX + 0.129_13 * logoletters.width, y: logoletters.minY + 0.487_24 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.047_65 * logoletters.width, y: logoletters.minY + 0.487_24 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.032_96 * logoletters.width, y: logoletters.minY + 0.503_72 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.042_93 * logoletters.width, y: logoletters.minY + 0.487_24 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.038_04 * logoletters.width, y: logoletters.minY + 0.492_72 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.022_95 * logoletters.width, y: logoletters.minY + 0.559_40 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.026_29 * logoletters.width, y: logoletters.minY + 0.517_47 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.022_95 * logoletters.width, y: logoletters.minY + 0.536_01 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.022_95 * logoletters.width, y: logoletters.minY + 0.642_58 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.033_28 * logoletters.width, y: logoletters.minY + 0.698_25 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.022_95 * logoletters.width, y: logoletters.minY + 0.666_39 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.026_39 * logoletters.width, y: logoletters.minY + 0.684_93 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.048_29 * logoletters.width, y: logoletters.minY + 0.713_35 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.038_36 * logoletters.width, y: logoletters.minY + 0.708_32 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.043_36 * logoletters.width, y: logoletters.minY + 0.713_35 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.105_31 * logoletters.width, y: logoletters.minY + 0.713_35 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.125_43 * logoletters.width, y: logoletters.minY + 0.687_93 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.115_53 * logoletters.width, y: logoletters.minY + 0.713_35 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.122_24 * logoletters.width, y: logoletters.minY + 0.704_89 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.129_57 * logoletters.width, y: logoletters.minY + 0.602_67 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.128_19 * logoletters.width, y: logoletters.minY + 0.673_71 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.129_57 * logoletters.width, y: logoletters.minY + 0.645_29 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.129_35 * logoletters.width, y: logoletters.minY + 0.550_82 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.129_57 * logoletters.width, y: logoletters.minY + 0.593_53 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.129_49 * logoletters.width, y: logoletters.minY + 0.576_25 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.129_13 * logoletters.width, y: logoletters.minY + 0.487_24 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.129_21 * logoletters.width, y: logoletters.minY + 0.525_41 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.129_13 * logoletters.width, y: logoletters.minY + 0.504_18 * logoletters.height))
        aletterPath.close()
        aletterPath.move(to: CGPoint(x: logoletters.minX + 0.152_10 * logoletters.width, y: logoletters.minY + 0.637_07 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.105_09 * logoletters.width, y: logoletters.minY + 0.834_65 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.152_10 * logoletters.width, y: logoletters.minY + 0.768_77 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.136_42 * logoletters.width, y: logoletters.minY + 0.834_65 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.048_95 * logoletters.width, y: logoletters.minY + 0.834_65 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.017_83 * logoletters.width, y: logoletters.minY + 0.791_39 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.037_71 * logoletters.width, y: logoletters.minY + 0.834_65 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.027_34 * logoletters.width, y: logoletters.minY + 0.820_26 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.000_00 * logoletters.width, y: logoletters.minY + 0.643_85 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.005_94 * logoletters.width, y: logoletters.minY + 0.755_73 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.000_00 * logoletters.width, y: logoletters.minY + 0.706_55 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.000_00 * logoletters.width, y: logoletters.minY + 0.560_14 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.016_99 * logoletters.width, y: logoletters.minY + 0.405_73 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.000_00 * logoletters.width, y: logoletters.minY + 0.491_51 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.005_66 * logoletters.width, y: logoletters.minY + 0.440_05 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.048_27 * logoletters.width, y: logoletters.minY + 0.365_96 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.025_71 * logoletters.width, y: logoletters.minY + 0.379_19 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.036_14 * logoletters.width, y: logoletters.minY + 0.365_96 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.129_57 * logoletters.width, y: logoletters.minY + 0.365_96 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.098_33 * logoletters.width, y: logoletters.minY + 0.296_72 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.128_40 * logoletters.width, y: logoletters.minY + 0.319_75 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.117_99 * logoletters.width, y: logoletters.minY + 0.296_72 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.090_56 * logoletters.width, y: logoletters.minY + 0.297_73 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.096_21 * logoletters.width, y: logoletters.minY + 0.296_72 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.093_62 * logoletters.width, y: logoletters.minY + 0.297_05 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.085_00 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.087_50 * logoletters.width, y: logoletters.minY + 0.298_42 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.085_65 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.076_48 * logoletters.width, y: logoletters.minY + 0.245_35 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.079_32 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.076_48 * logoletters.width, y: logoletters.minY + 0.280_95 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.076_48 * logoletters.width, y: logoletters.minY + 0.230_93 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.084_96 * logoletters.width, y: logoletters.minY + 0.176_78 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.076_48 * logoletters.width, y: logoletters.minY + 0.194_85 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.079_31 * logoletters.width, y: logoletters.minY + 0.176_78 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.126_96 * logoletters.width, y: logoletters.minY + 0.200_12 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.104_19 * logoletters.width, y: logoletters.minY + 0.176_78 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.118_18 * logoletters.width, y: logoletters.minY + 0.184_58 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.152_10 * logoletters.width, y: logoletters.minY + 0.379_14 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.143_71 * logoletters.width, y: logoletters.minY + 0.229_39 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.152_10 * logoletters.width, y: logoletters.minY + 0.289_07 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.152_10 * logoletters.width, y: logoletters.minY + 0.637_07 * logoletters.height))
        aletterPath.close()
        adorsysBlueDark.setFill()
        aletterPath.fill()

        //// d-letter Drawing
        let dletterPath = UIBezierPath()
        dletterPath.move(to: CGPoint(x: logoletters.minX + 0.290_80 * logoletters.width, y: logoletters.minY + 0.629_62 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.290_80 * logoletters.width, y: logoletters.minY + 0.303_59 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.221_71 * logoletters.width, y: logoletters.minY + 0.303_59 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.190_93 * logoletters.width, y: logoletters.minY + 0.389_36 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.201_19 * logoletters.width, y: logoletters.minY + 0.303_59 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.190_93 * logoletters.width, y: logoletters.minY + 0.332_18 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.190_93 * logoletters.width, y: logoletters.minY + 0.622_75 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.202_46 * logoletters.width, y: logoletters.minY + 0.705_11 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.190_93 * logoletters.width, y: logoletters.minY + 0.665_32 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.194_77 * logoletters.width, y: logoletters.minY + 0.692_77 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.222_26 * logoletters.width, y: logoletters.minY + 0.713_34 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.205_94 * logoletters.width, y: logoletters.minY + 0.710_63 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.212_55 * logoletters.width, y: logoletters.minY + 0.713_34 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.255_33 * logoletters.width, y: logoletters.minY + 0.713_34 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.290_80 * logoletters.width, y: logoletters.minY + 0.629_62 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.278_98 * logoletters.width, y: logoletters.minY + 0.713_34 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.290_80 * logoletters.width, y: logoletters.minY + 0.685_45 * logoletters.height))
        dletterPath.close()
        dletterPath.move(to: CGPoint(x: logoletters.minX + 0.313_75 * logoletters.width, y: logoletters.minY + 0.632_34 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.292_65 * logoletters.width, y: logoletters.minY + 0.792_81 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.313_75 * logoletters.width, y: logoletters.minY + 0.702_30 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.306_72 * logoletters.width, y: logoletters.minY + 0.755_76 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.257_61 * logoletters.width, y: logoletters.minY + 0.834_64 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.282_06 * logoletters.width, y: logoletters.minY + 0.820_69 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.270_39 * logoletters.width, y: logoletters.minY + 0.834_64 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.222_58 * logoletters.width, y: logoletters.minY + 0.834_64 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.167_65 * logoletters.width, y: logoletters.minY + 0.648_75 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.186_68 * logoletters.width, y: logoletters.minY + 0.834_64 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.168_37 * logoletters.width, y: logoletters.minY + 0.772_70 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.167_97 * logoletters.width, y: logoletters.minY + 0.386_72 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.167_28 * logoletters.width, y: logoletters.minY + 0.579_70 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.167_40 * logoletters.width, y: logoletters.minY + 0.492_37 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.222_26 * logoletters.width, y: logoletters.minY + 0.182_29 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.168_70 * logoletters.width, y: logoletters.minY + 0.250_41 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.186_79 * logoletters.width, y: logoletters.minY + 0.182_29 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.290_80 * logoletters.width, y: logoletters.minY + 0.182_29 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.290_80 * logoletters.width, y: logoletters.minY + 0.054_13 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.299_28 * logoletters.width, y: logoletters.minY + 0.000_00 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.290_80 * logoletters.width, y: logoletters.minY + 0.018_07 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.293_62 * logoletters.width, y: logoletters.minY + 0.000_00 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.309_08 * logoletters.width, y: logoletters.minY + 0.004_13 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.304_51 * logoletters.width, y: logoletters.minY + 0.000_00 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.307_77 * logoletters.width, y: logoletters.minY + 0.001_37 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.313_75 * logoletters.width, y: logoletters.minY + 0.054_18 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.312_20 * logoletters.width, y: logoletters.minY + 0.010_52 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.313_75 * logoletters.width, y: logoletters.minY + 0.027_18 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.313_75 * logoletters.width, y: logoletters.minY + 0.632_34 * logoletters.height))
        dletterPath.close()
        adorsysBlueDark.setFill()
        dletterPath.fill()

        //// o-letter Drawing
        let oletterPath = UIBezierPath()
        oletterPath.move(to: CGPoint(x: logoletters.minX + 0.446_92 * logoletters.width, y: logoletters.minY + 0.630_29 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.446_92 * logoletters.width, y: logoletters.minY + 0.377_06 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.418_63 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.446_92 * logoletters.width, y: logoletters.minY + 0.324_86 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.437_49 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.381_31 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.362_60 * logoletters.width, y: logoletters.minY + 0.315_26 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.374_42 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.368_19 * logoletters.width, y: logoletters.minY + 0.304_27 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.350_85 * logoletters.width, y: logoletters.minY + 0.388_02 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.354_77 * logoletters.width, y: logoletters.minY + 0.331_27 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.350_85 * logoletters.width, y: logoletters.minY + 0.355_51 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.350_85 * logoletters.width, y: logoletters.minY + 0.630_29 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.362_93 * logoletters.width, y: logoletters.minY + 0.698_95 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.350_85 * logoletters.width, y: logoletters.minY + 0.661_86 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.354_88 * logoletters.width, y: logoletters.minY + 0.684_74 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.381_43 * logoletters.width, y: logoletters.minY + 0.713_34 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.368_29 * logoletters.width, y: logoletters.minY + 0.708_53 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.374_46 * logoletters.width, y: logoletters.minY + 0.713_34 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.418_74 * logoletters.width, y: logoletters.minY + 0.713_34 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.435_83 * logoletters.width, y: logoletters.minY + 0.696_88 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.424_83 * logoletters.width, y: logoletters.minY + 0.713_34 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.430_53 * logoletters.width, y: logoletters.minY + 0.707_85 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.446_92 * logoletters.width, y: logoletters.minY + 0.630_29 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.443_22 * logoletters.width, y: logoletters.minY + 0.681_79 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.446_92 * logoletters.width, y: logoletters.minY + 0.659_59 * logoletters.height))
        oletterPath.close()
        oletterPath.move(to: CGPoint(x: logoletters.minX + 0.470_21 * logoletters.width, y: logoletters.minY + 0.630_22 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.452_58 * logoletters.width, y: logoletters.minY + 0.794_86 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.470_21 * logoletters.width, y: logoletters.minY + 0.704_77 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.464_33 * logoletters.width, y: logoletters.minY + 0.759_64 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.419_28 * logoletters.width, y: logoletters.minY + 0.834_64 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.443_66 * logoletters.width, y: logoletters.minY + 0.821_40 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.432_57 * logoletters.width, y: logoletters.minY + 0.834_64 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.381_10 * logoletters.width, y: logoletters.minY + 0.834_64 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.347_05 * logoletters.width, y: logoletters.minY + 0.794_18 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.367_90 * logoletters.width, y: logoletters.minY + 0.834_64 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.356_55 * logoletters.width, y: logoletters.minY + 0.821_15 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.327_90 * logoletters.width, y: logoletters.minY + 0.630_22 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.334_27 * logoletters.width, y: logoletters.minY + 0.758_49 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.327_90 * logoletters.width, y: logoletters.minY + 0.703_88 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.327_90 * logoletters.width, y: logoletters.minY + 0.388_09 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.346_94 * logoletters.width, y: logoletters.minY + 0.221_37 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.327_90 * logoletters.width, y: logoletters.minY + 0.315_38 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.334_25 * logoletters.width, y: logoletters.minY + 0.259_80 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.380_99 * logoletters.width, y: logoletters.minY + 0.176_80 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.356_88 * logoletters.width, y: logoletters.minY + 0.191_64 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.368_23 * logoletters.width, y: logoletters.minY + 0.176_80 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.419_28 * logoletters.width, y: logoletters.minY + 0.176_80 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.470_21 * logoletters.width, y: logoletters.minY + 0.386_72 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.453_23 * logoletters.width, y: logoletters.minY + 0.176_80 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.470_21 * logoletters.width, y: logoletters.minY + 0.246_77 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.470_21 * logoletters.width, y: logoletters.minY + 0.630_22 * logoletters.height))
        oletterPath.close()
        adorsysBlueDark.setFill()
        oletterPath.fill()

        //// r-letter Drawing
        let rletterPath = UIBezierPath()
        rletterPath.move(to: CGPoint(x: logoletters.minX + 0.552_47 * logoletters.width, y: logoletters.minY + 0.245_34 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.543_87 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.552_47 * logoletters.width, y: logoletters.minY + 0.280_95 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.549_59 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height))
        rletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.539_57 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height))
        rletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.534_09 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.507_64 * logoletters.width, y: logoletters.minY + 0.381_58 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.516_45 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.507_64 * logoletters.width, y: logoletters.minY + 0.326_38 * logoletters.height))
        rletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.507_64 * logoletters.width, y: logoletters.minY + 0.780_57 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.502_96 * logoletters.width, y: logoletters.minY + 0.830_53 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.507_64 * logoletters.width, y: logoletters.minY + 0.807_51 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.506_09 * logoletters.width, y: logoletters.minY + 0.824_17 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.492_84 * logoletters.width, y: logoletters.minY + 0.834_64 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.501_73 * logoletters.width, y: logoletters.minY + 0.833_28 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.498_35 * logoletters.width, y: logoletters.minY + 0.834_64 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.484_35 * logoletters.width, y: logoletters.minY + 0.779_76 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.487_19 * logoletters.width, y: logoletters.minY + 0.834_64 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.484_35 * logoletters.width, y: logoletters.minY + 0.816_36 * logoletters.height))
        rletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.484_69 * logoletters.width, y: logoletters.minY + 0.380_53 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.543_87 * logoletters.width, y: logoletters.minY + 0.176_80 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.484_69 * logoletters.width, y: logoletters.minY + 0.244_72 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.504_41 * logoletters.width, y: logoletters.minY + 0.176_80 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.552_47 * logoletters.width, y: logoletters.minY + 0.245_34 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.549_59 * logoletters.width, y: logoletters.minY + 0.176_80 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.552_47 * logoletters.width, y: logoletters.minY + 0.199_67 * logoletters.height))
        rletterPath.close()
        adorsysBlueDark.setFill()
        rletterPath.fill()

        //// s-letter Drawing
        let sletterPath = UIBezierPath()
        sletterPath.move(to: CGPoint(x: logoletters.minX + 0.696_79 * logoletters.width, y: logoletters.minY + 0.646_58 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.651_32 * logoletters.width, y: logoletters.minY + 0.834_65 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.696_79 * logoletters.width, y: logoletters.minY + 0.771_94 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.681_64 * logoletters.width, y: logoletters.minY + 0.834_65 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.573_63 * logoletters.width, y: logoletters.minY + 0.834_65 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.565_15 * logoletters.width, y: logoletters.minY + 0.780_53 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.567_98 * logoletters.width, y: logoletters.minY + 0.834_65 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.565_15 * logoletters.width, y: logoletters.minY + 0.816_63 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.573_63 * logoletters.width, y: logoletters.minY + 0.713_35 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.565_15 * logoletters.width, y: logoletters.minY + 0.735_75 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.567_98 * logoletters.width, y: logoletters.minY + 0.713_35 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.651_43 * logoletters.width, y: logoletters.minY + 0.713_35 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.672_97 * logoletters.width, y: logoletters.minY + 0.646_60 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.665_78 * logoletters.width, y: logoletters.minY + 0.713_35 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.672_97 * logoletters.width, y: logoletters.minY + 0.691_11 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.672_97 * logoletters.width, y: logoletters.minY + 0.621_83 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.653_38 * logoletters.width, y: logoletters.minY + 0.561_94 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.672_97 * logoletters.width, y: logoletters.minY + 0.581_89 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.666_44 * logoletters.width, y: logoletters.minY + 0.561_94 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.616_07 * logoletters.width, y: logoletters.minY + 0.561_94 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.564_61 * logoletters.width, y: logoletters.minY + 0.381_00 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.581_76 * logoletters.width, y: logoletters.minY + 0.561_94 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.564_61 * logoletters.width, y: logoletters.minY + 0.501_61 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.564_61 * logoletters.width, y: logoletters.minY + 0.345_39 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.590_83 * logoletters.width, y: logoletters.minY + 0.190_52 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.564_61 * logoletters.width, y: logoletters.minY + 0.264_97 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.573_35 * logoletters.width, y: logoletters.minY + 0.213_36 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.631_07 * logoletters.width, y: logoletters.minY + 0.176_79 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.597_86 * logoletters.width, y: logoletters.minY + 0.181_36 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.611_28 * logoletters.width, y: logoletters.minY + 0.176_79 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.639_67 * logoletters.width, y: logoletters.minY + 0.230_92 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.636_81 * logoletters.width, y: logoletters.minY + 0.176_79 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.639_67 * logoletters.width, y: logoletters.minY + 0.194_85 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.639_67 * logoletters.width, y: logoletters.minY + 0.245_35 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.631_07 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.639_67 * logoletters.width, y: logoletters.minY + 0.280_95 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.636_81 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.614_54 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.599_09 * logoletters.width, y: logoletters.minY + 0.300_83 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.606_06 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.600_91 * logoletters.width, y: logoletters.minY + 0.299_46 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.587_56 * logoletters.width, y: logoletters.minY + 0.345_39 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.591_41 * logoletters.width, y: logoletters.minY + 0.306_32 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.587_56 * logoletters.width, y: logoletters.minY + 0.321_13 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.587_56 * logoletters.width, y: logoletters.minY + 0.379_63 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.599_42 * logoletters.width, y: logoletters.minY + 0.433_76 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.587_56 * logoletters.width, y: logoletters.minY + 0.407_97 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.591_51 * logoletters.width, y: logoletters.minY + 0.426_02 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.616_18 * logoletters.width, y: logoletters.minY + 0.438_56 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.602_39 * logoletters.width, y: logoletters.minY + 0.436_97 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.607_97 * logoletters.width, y: logoletters.minY + 0.438_56 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.654_25 * logoletters.width, y: logoletters.minY + 0.438_56 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.696_79 * logoletters.width, y: logoletters.minY + 0.616_37 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.682_61 * logoletters.width, y: logoletters.minY + 0.438_56 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.696_79 * logoletters.width, y: logoletters.minY + 0.497_83 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.696_79 * logoletters.width, y: logoletters.minY + 0.646_58 * logoletters.height))
        sletterPath.close()
        adorsysBlueDark.setFill()
        sletterPath.fill()

        //// y-letter Drawing
        let yletterPath = UIBezierPath()
        yletterPath.move(to: CGPoint(x: logoletters.minX + 0.849_75 * logoletters.width, y: logoletters.minY + 0.180_90 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.839_85 * logoletters.width, y: logoletters.minY + 0.176_79 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.848_44 * logoletters.width, y: logoletters.minY + 0.178_18 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.845_15 * logoletters.width, y: logoletters.minY + 0.176_79 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.831_26 * logoletters.width, y: logoletters.minY + 0.230_92 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.834_12 * logoletters.width, y: logoletters.minY + 0.176_79 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.831_26 * logoletters.width, y: logoletters.minY + 0.194_85 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.831_26 * logoletters.width, y: logoletters.minY + 0.677_41 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.831_23 * logoletters.width, y: logoletters.minY + 0.707_87 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.762_71 * logoletters.width, y: logoletters.minY + 0.707_87 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.733_89 * logoletters.width, y: logoletters.minY + 0.632_49 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.743_50 * logoletters.width, y: logoletters.minY + 0.707_87 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.733_89 * logoletters.width, y: logoletters.minY + 0.682_73 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.733_89 * logoletters.width, y: logoletters.minY + 0.230_92 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.725_40 * logoletters.width, y: logoletters.minY + 0.176_79 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.733_89 * logoletters.width, y: logoletters.minY + 0.194_85 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.731_06 * logoletters.width, y: logoletters.minY + 0.176_79 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.715_51 * logoletters.width, y: logoletters.minY + 0.180_90 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.720_11 * logoletters.width, y: logoletters.minY + 0.176_79 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.716_80 * logoletters.width, y: logoletters.minY + 0.178_18 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.710_93 * logoletters.width, y: logoletters.minY + 0.230_92 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.712_45 * logoletters.width, y: logoletters.minY + 0.187_31 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.710_93 * logoletters.width, y: logoletters.minY + 0.203_96 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.710_93 * logoletters.width, y: logoletters.minY + 0.632_49 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.762_71 * logoletters.width, y: logoletters.minY + 0.828_49 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.710_93 * logoletters.width, y: logoletters.minY + 0.763_18 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.728_20 * logoletters.width, y: logoletters.minY + 0.828_49 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.831_13 * logoletters.width, y: logoletters.minY + 0.828_49 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.831_04 * logoletters.width, y: logoletters.minY + 0.945_15 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.839_52 * logoletters.width, y: logoletters.minY + 1.000_00 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.831_04 * logoletters.width, y: logoletters.minY + 0.981_71 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.833_87 * logoletters.width, y: logoletters.minY + 1.000_00 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.849_64 * logoletters.width, y: logoletters.minY + 0.995_90 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.845_04 * logoletters.width, y: logoletters.minY + 1.000_00 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.848_41 * logoletters.width, y: logoletters.minY + 0.998_63 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.854_32 * logoletters.width, y: logoletters.minY + 0.945_95 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.852_76 * logoletters.width, y: logoletters.minY + 0.989_52 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.854_32 * logoletters.width, y: logoletters.minY + 0.972_87 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.854_32 * logoletters.width, y: logoletters.minY + 0.230_92 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.849_75 * logoletters.width, y: logoletters.minY + 0.180_90 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.854_32 * logoletters.width, y: logoletters.minY + 0.204_42 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.852_80 * logoletters.width, y: logoletters.minY + 0.187_79 * logoletters.height))
        yletterPath.close()
        adorsysBlueDark.setFill()
        yletterPath.fill()

        //// 2nd-s-letter Drawing
        // swiftlint:disable:next identifier_name
        let _2ndsletterPath = UIBezierPath()
        _2ndsletterPath.move(to: CGPoint(x: logoletters.minX + 1.000_00 * logoletters.width, y: logoletters.minY + 0.646_58 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.954_53 * logoletters.width, y: logoletters.minY + 0.834_65 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 1.000_00 * logoletters.width, y: logoletters.minY + 0.771_94 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.984_84 * logoletters.width, y: logoletters.minY + 0.834_65 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.876_84 * logoletters.width, y: logoletters.minY + 0.834_65 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.868_35 * logoletters.width, y: logoletters.minY + 0.780_53 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.871_19 * logoletters.width, y: logoletters.minY + 0.834_65 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.868_35 * logoletters.width, y: logoletters.minY + 0.816_63 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.876_84 * logoletters.width, y: logoletters.minY + 0.713_35 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.868_35 * logoletters.width, y: logoletters.minY + 0.735_75 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.871_19 * logoletters.width, y: logoletters.minY + 0.713_35 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.954_63 * logoletters.width, y: logoletters.minY + 0.713_35 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.976_17 * logoletters.width, y: logoletters.minY + 0.646_60 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.969_00 * logoletters.width, y: logoletters.minY + 0.713_35 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.976_17 * logoletters.width, y: logoletters.minY + 0.691_11 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.976_17 * logoletters.width, y: logoletters.minY + 0.621_83 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.956_58 * logoletters.width, y: logoletters.minY + 0.561_94 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.976_17 * logoletters.width, y: logoletters.minY + 0.581_89 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.969_64 * logoletters.width, y: logoletters.minY + 0.561_94 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.919_27 * logoletters.width, y: logoletters.minY + 0.561_94 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.867_81 * logoletters.width, y: logoletters.minY + 0.381_00 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.884_97 * logoletters.width, y: logoletters.minY + 0.561_94 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.867_81 * logoletters.width, y: logoletters.minY + 0.501_61 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.867_81 * logoletters.width, y: logoletters.minY + 0.345_39 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.894_03 * logoletters.width, y: logoletters.minY + 0.190_52 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.867_81 * logoletters.width, y: logoletters.minY + 0.264_97 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.876_56 * logoletters.width, y: logoletters.minY + 0.213_36 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.934_29 * logoletters.width, y: logoletters.minY + 0.176_79 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.901_07 * logoletters.width, y: logoletters.minY + 0.181_36 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.914_49 * logoletters.width, y: logoletters.minY + 0.176_79 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.942_88 * logoletters.width, y: logoletters.minY + 0.230_92 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.940_01 * logoletters.width, y: logoletters.minY + 0.176_79 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.942_88 * logoletters.width, y: logoletters.minY + 0.194_85 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.942_88 * logoletters.width, y: logoletters.minY + 0.245_35 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.934_29 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.942_88 * logoletters.width, y: logoletters.minY + 0.280_95 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.940_01 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.917_74 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.902_29 * logoletters.width, y: logoletters.minY + 0.300_83 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.909_26 * logoletters.width, y: logoletters.minY + 0.298_75 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.904_12 * logoletters.width, y: logoletters.minY + 0.299_46 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.890_77 * logoletters.width, y: logoletters.minY + 0.345_39 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.894_62 * logoletters.width, y: logoletters.minY + 0.306_32 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.890_77 * logoletters.width, y: logoletters.minY + 0.321_13 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.890_77 * logoletters.width, y: logoletters.minY + 0.379_63 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.902_63 * logoletters.width, y: logoletters.minY + 0.433_76 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.890_77 * logoletters.width, y: logoletters.minY + 0.407_97 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.894_72 * logoletters.width, y: logoletters.minY + 0.426_02 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.919_38 * logoletters.width, y: logoletters.minY + 0.438_56 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.905_60 * logoletters.width, y: logoletters.minY + 0.436_97 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.911_18 * logoletters.width, y: logoletters.minY + 0.438_56 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.957_46 * logoletters.width, y: logoletters.minY + 0.438_56 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 1.000_00 * logoletters.width, y: logoletters.minY + 0.616_37 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.985_82 * logoletters.width, y: logoletters.minY + 0.438_56 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 1.000_00 * logoletters.width, y: logoletters.minY + 0.497_83 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 1.000_00 * logoletters.width, y: logoletters.minY + 0.646_58 * logoletters.height))
        _2ndsletterPath.close()
        adorsysBlueDark.setFill()
        _2ndsletterPath.fill()
    }
    // swiftlint:enable line_length
    // swiftlint:enable function_body_length
}
