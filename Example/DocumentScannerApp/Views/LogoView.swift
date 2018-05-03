//
//  LogoView.swift
//  DocumentScannerApp
//
//  Created by Steff Blümm on 30.04.18.
//  Copyright © 2018 Steff Blümm. All rights reserved.
//

import UIKit


@IBDesignable class LogoView: UIView {
    
    private var adorsysDarkBlue: UIColor {
        return UIColor(red: 0.000, green: 0.352, blue: 0.484, alpha: 1.000)
    }
    
    private var white: UIColor {
        return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.000)
    }
    
    private var factor: CGFloat {
        return 63.0 / 397.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = .clear
    }
    
    
    override func draw(_ rect: CGRect) {
        let frameWidth = self.frame.width
        let frameHeight = self.frame.height
        
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
    
    
    
    func drawLogo(frame: CGRect = CGRect(x: 0, y: 0, width: 397, height: 63),
                  colour: UIColor) {
        //// Color Declarations
        let adorsysBlueDark = colour
        
        
        //// Subframes
        let logoletters: CGRect = CGRect(x: frame.minX, y: frame.minY, width: frame.width - 0.22, height: frame.height - 0.01)
        
        
        //// logo-letters
        //// a-letter Drawing
        let aletterPath = UIBezierPath()
        aletterPath.move(to: CGPoint(x: logoletters.minX + 0.12913 * logoletters.width, y: logoletters.minY + 0.48724 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.04765 * logoletters.width, y: logoletters.minY + 0.48724 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.03296 * logoletters.width, y: logoletters.minY + 0.50372 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.04293 * logoletters.width, y: logoletters.minY + 0.48724 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.03804 * logoletters.width, y: logoletters.minY + 0.49272 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.02295 * logoletters.width, y: logoletters.minY + 0.55940 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.02629 * logoletters.width, y: logoletters.minY + 0.51747 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.02295 * logoletters.width, y: logoletters.minY + 0.53601 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.02295 * logoletters.width, y: logoletters.minY + 0.64258 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.03328 * logoletters.width, y: logoletters.minY + 0.69825 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.02295 * logoletters.width, y: logoletters.minY + 0.66639 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.02639 * logoletters.width, y: logoletters.minY + 0.68493 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.04829 * logoletters.width, y: logoletters.minY + 0.71335 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.03836 * logoletters.width, y: logoletters.minY + 0.70832 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.04336 * logoletters.width, y: logoletters.minY + 0.71335 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.10531 * logoletters.width, y: logoletters.minY + 0.71335 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.12543 * logoletters.width, y: logoletters.minY + 0.68793 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.11553 * logoletters.width, y: logoletters.minY + 0.71335 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.12224 * logoletters.width, y: logoletters.minY + 0.70489 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.12957 * logoletters.width, y: logoletters.minY + 0.60267 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.12819 * logoletters.width, y: logoletters.minY + 0.67371 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.12957 * logoletters.width, y: logoletters.minY + 0.64529 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.12935 * logoletters.width, y: logoletters.minY + 0.55082 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.12957 * logoletters.width, y: logoletters.minY + 0.59353 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.12949 * logoletters.width, y: logoletters.minY + 0.57625 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.12913 * logoletters.width, y: logoletters.minY + 0.48724 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.12921 * logoletters.width, y: logoletters.minY + 0.52541 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.12913 * logoletters.width, y: logoletters.minY + 0.50418 * logoletters.height))
        aletterPath.close()
        aletterPath.move(to: CGPoint(x: logoletters.minX + 0.15210 * logoletters.width, y: logoletters.minY + 0.63707 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.10509 * logoletters.width, y: logoletters.minY + 0.83465 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.15210 * logoletters.width, y: logoletters.minY + 0.76877 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.13642 * logoletters.width, y: logoletters.minY + 0.83465 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.04895 * logoletters.width, y: logoletters.minY + 0.83465 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.01783 * logoletters.width, y: logoletters.minY + 0.79139 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.03771 * logoletters.width, y: logoletters.minY + 0.83465 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.02734 * logoletters.width, y: logoletters.minY + 0.82026 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.00000 * logoletters.width, y: logoletters.minY + 0.64385 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.00594 * logoletters.width, y: logoletters.minY + 0.75573 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.00000 * logoletters.width, y: logoletters.minY + 0.70655 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.00000 * logoletters.width, y: logoletters.minY + 0.56014 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.01699 * logoletters.width, y: logoletters.minY + 0.40573 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.00000 * logoletters.width, y: logoletters.minY + 0.49151 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.00566 * logoletters.width, y: logoletters.minY + 0.44005 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.04827 * logoletters.width, y: logoletters.minY + 0.36596 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.02571 * logoletters.width, y: logoletters.minY + 0.37919 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.03614 * logoletters.width, y: logoletters.minY + 0.36596 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.12957 * logoletters.width, y: logoletters.minY + 0.36596 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.09833 * logoletters.width, y: logoletters.minY + 0.29672 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.12840 * logoletters.width, y: logoletters.minY + 0.31975 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.11799 * logoletters.width, y: logoletters.minY + 0.29672 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.09056 * logoletters.width, y: logoletters.minY + 0.29773 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.09621 * logoletters.width, y: logoletters.minY + 0.29672 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.09362 * logoletters.width, y: logoletters.minY + 0.29705 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.08500 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.08750 * logoletters.width, y: logoletters.minY + 0.29842 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.08565 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.07648 * logoletters.width, y: logoletters.minY + 0.24535 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.07932 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.07648 * logoletters.width, y: logoletters.minY + 0.28095 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.07648 * logoletters.width, y: logoletters.minY + 0.23093 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.08496 * logoletters.width, y: logoletters.minY + 0.17678 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.07648 * logoletters.width, y: logoletters.minY + 0.19485 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.07931 * logoletters.width, y: logoletters.minY + 0.17678 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.12696 * logoletters.width, y: logoletters.minY + 0.20012 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.10419 * logoletters.width, y: logoletters.minY + 0.17678 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.11818 * logoletters.width, y: logoletters.minY + 0.18458 * logoletters.height))
        aletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.15210 * logoletters.width, y: logoletters.minY + 0.37914 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.14371 * logoletters.width, y: logoletters.minY + 0.22939 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.15210 * logoletters.width, y: logoletters.minY + 0.28907 * logoletters.height))
        aletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.15210 * logoletters.width, y: logoletters.minY + 0.63707 * logoletters.height))
        aletterPath.close()
        adorsysBlueDark.setFill()
        aletterPath.fill()
        
        
        //// d-letter Drawing
        let dletterPath = UIBezierPath()
        dletterPath.move(to: CGPoint(x: logoletters.minX + 0.29080 * logoletters.width, y: logoletters.minY + 0.62962 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.29080 * logoletters.width, y: logoletters.minY + 0.30359 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.22171 * logoletters.width, y: logoletters.minY + 0.30359 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.19093 * logoletters.width, y: logoletters.minY + 0.38936 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.20119 * logoletters.width, y: logoletters.minY + 0.30359 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.19093 * logoletters.width, y: logoletters.minY + 0.33218 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.19093 * logoletters.width, y: logoletters.minY + 0.62275 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.20246 * logoletters.width, y: logoletters.minY + 0.70511 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.19093 * logoletters.width, y: logoletters.minY + 0.66532 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.19477 * logoletters.width, y: logoletters.minY + 0.69277 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.22226 * logoletters.width, y: logoletters.minY + 0.71334 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.20594 * logoletters.width, y: logoletters.minY + 0.71063 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.21255 * logoletters.width, y: logoletters.minY + 0.71334 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.25533 * logoletters.width, y: logoletters.minY + 0.71334 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.29080 * logoletters.width, y: logoletters.minY + 0.62962 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.27898 * logoletters.width, y: logoletters.minY + 0.71334 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.29080 * logoletters.width, y: logoletters.minY + 0.68545 * logoletters.height))
        dletterPath.close()
        dletterPath.move(to: CGPoint(x: logoletters.minX + 0.31375 * logoletters.width, y: logoletters.minY + 0.63234 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.29265 * logoletters.width, y: logoletters.minY + 0.79281 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.31375 * logoletters.width, y: logoletters.minY + 0.70230 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.30672 * logoletters.width, y: logoletters.minY + 0.75576 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.25761 * logoletters.width, y: logoletters.minY + 0.83464 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.28206 * logoletters.width, y: logoletters.minY + 0.82069 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.27039 * logoletters.width, y: logoletters.minY + 0.83464 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.22258 * logoletters.width, y: logoletters.minY + 0.83464 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.16765 * logoletters.width, y: logoletters.minY + 0.64875 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.18668 * logoletters.width, y: logoletters.minY + 0.83464 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.16837 * logoletters.width, y: logoletters.minY + 0.77270 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.16797 * logoletters.width, y: logoletters.minY + 0.38672 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.16728 * logoletters.width, y: logoletters.minY + 0.57970 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.16740 * logoletters.width, y: logoletters.minY + 0.49237 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.22226 * logoletters.width, y: logoletters.minY + 0.18229 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.16870 * logoletters.width, y: logoletters.minY + 0.25041 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.18679 * logoletters.width, y: logoletters.minY + 0.18229 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.29080 * logoletters.width, y: logoletters.minY + 0.18229 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.29080 * logoletters.width, y: logoletters.minY + 0.05413 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.29928 * logoletters.width, y: logoletters.minY + 0.00000 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.29080 * logoletters.width, y: logoletters.minY + 0.01807 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.29362 * logoletters.width, y: logoletters.minY + 0.00000 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.30908 * logoletters.width, y: logoletters.minY + 0.00413 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.30451 * logoletters.width, y: logoletters.minY + 0.00000 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.30777 * logoletters.width, y: logoletters.minY + 0.00137 * logoletters.height))
        dletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.31375 * logoletters.width, y: logoletters.minY + 0.05418 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.31220 * logoletters.width, y: logoletters.minY + 0.01052 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.31375 * logoletters.width, y: logoletters.minY + 0.02718 * logoletters.height))
        dletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.31375 * logoletters.width, y: logoletters.minY + 0.63234 * logoletters.height))
        dletterPath.close()
        adorsysBlueDark.setFill()
        dletterPath.fill()
        
        
        //// o-letter Drawing
        let oletterPath = UIBezierPath()
        oletterPath.move(to: CGPoint(x: logoletters.minX + 0.44692 * logoletters.width, y: logoletters.minY + 0.63029 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.44692 * logoletters.width, y: logoletters.minY + 0.37706 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.41863 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.44692 * logoletters.width, y: logoletters.minY + 0.32486 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.43749 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.38131 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.36260 * logoletters.width, y: logoletters.minY + 0.31526 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.37442 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.36819 * logoletters.width, y: logoletters.minY + 0.30427 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.35085 * logoletters.width, y: logoletters.minY + 0.38802 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.35477 * logoletters.width, y: logoletters.minY + 0.33127 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.35085 * logoletters.width, y: logoletters.minY + 0.35551 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.35085 * logoletters.width, y: logoletters.minY + 0.63029 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.36293 * logoletters.width, y: logoletters.minY + 0.69895 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.35085 * logoletters.width, y: logoletters.minY + 0.66186 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.35488 * logoletters.width, y: logoletters.minY + 0.68474 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.38143 * logoletters.width, y: logoletters.minY + 0.71334 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.36829 * logoletters.width, y: logoletters.minY + 0.70853 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.37446 * logoletters.width, y: logoletters.minY + 0.71334 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.41874 * logoletters.width, y: logoletters.minY + 0.71334 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.43583 * logoletters.width, y: logoletters.minY + 0.69688 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.42483 * logoletters.width, y: logoletters.minY + 0.71334 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.43053 * logoletters.width, y: logoletters.minY + 0.70785 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.44692 * logoletters.width, y: logoletters.minY + 0.63029 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.44322 * logoletters.width, y: logoletters.minY + 0.68179 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.44692 * logoletters.width, y: logoletters.minY + 0.65959 * logoletters.height))
        oletterPath.close()
        oletterPath.move(to: CGPoint(x: logoletters.minX + 0.47021 * logoletters.width, y: logoletters.minY + 0.63022 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.45258 * logoletters.width, y: logoletters.minY + 0.79486 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.47021 * logoletters.width, y: logoletters.minY + 0.70477 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.46433 * logoletters.width, y: logoletters.minY + 0.75964 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.41928 * logoletters.width, y: logoletters.minY + 0.83464 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.44366 * logoletters.width, y: logoletters.minY + 0.82140 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.43257 * logoletters.width, y: logoletters.minY + 0.83464 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.38110 * logoletters.width, y: logoletters.minY + 0.83464 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.34705 * logoletters.width, y: logoletters.minY + 0.79418 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.36790 * logoletters.width, y: logoletters.minY + 0.83464 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.35655 * logoletters.width, y: logoletters.minY + 0.82115 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.32790 * logoletters.width, y: logoletters.minY + 0.63022 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.33427 * logoletters.width, y: logoletters.minY + 0.75849 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.32790 * logoletters.width, y: logoletters.minY + 0.70388 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.32790 * logoletters.width, y: logoletters.minY + 0.38809 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.34694 * logoletters.width, y: logoletters.minY + 0.22137 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.32790 * logoletters.width, y: logoletters.minY + 0.31538 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.33425 * logoletters.width, y: logoletters.minY + 0.25980 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.38099 * logoletters.width, y: logoletters.minY + 0.17680 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.35688 * logoletters.width, y: logoletters.minY + 0.19164 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.36823 * logoletters.width, y: logoletters.minY + 0.17680 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.41928 * logoletters.width, y: logoletters.minY + 0.17680 * logoletters.height))
        oletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.47021 * logoletters.width, y: logoletters.minY + 0.38672 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.45323 * logoletters.width, y: logoletters.minY + 0.17680 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.47021 * logoletters.width, y: logoletters.minY + 0.24677 * logoletters.height))
        oletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.47021 * logoletters.width, y: logoletters.minY + 0.63022 * logoletters.height))
        oletterPath.close()
        adorsysBlueDark.setFill()
        oletterPath.fill()
        
        
        //// r-letter Drawing
        let rletterPath = UIBezierPath()
        rletterPath.move(to: CGPoint(x: logoletters.minX + 0.55247 * logoletters.width, y: logoletters.minY + 0.24534 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.54387 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.55247 * logoletters.width, y: logoletters.minY + 0.28095 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.54959 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height))
        rletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.53957 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height))
        rletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.53409 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.50764 * logoletters.width, y: logoletters.minY + 0.38158 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.51645 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.50764 * logoletters.width, y: logoletters.minY + 0.32638 * logoletters.height))
        rletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.50764 * logoletters.width, y: logoletters.minY + 0.78057 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.50296 * logoletters.width, y: logoletters.minY + 0.83053 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.50764 * logoletters.width, y: logoletters.minY + 0.80751 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.50609 * logoletters.width, y: logoletters.minY + 0.82417 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.49284 * logoletters.width, y: logoletters.minY + 0.83464 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.50173 * logoletters.width, y: logoletters.minY + 0.83328 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.49835 * logoletters.width, y: logoletters.minY + 0.83464 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.48435 * logoletters.width, y: logoletters.minY + 0.77976 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.48719 * logoletters.width, y: logoletters.minY + 0.83464 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.48435 * logoletters.width, y: logoletters.minY + 0.81636 * logoletters.height))
        rletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.48469 * logoletters.width, y: logoletters.minY + 0.38053 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.54387 * logoletters.width, y: logoletters.minY + 0.17680 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.48469 * logoletters.width, y: logoletters.minY + 0.24472 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.50441 * logoletters.width, y: logoletters.minY + 0.17680 * logoletters.height))
        rletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.55247 * logoletters.width, y: logoletters.minY + 0.24534 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.54959 * logoletters.width, y: logoletters.minY + 0.17680 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.55247 * logoletters.width, y: logoletters.minY + 0.19967 * logoletters.height))
        rletterPath.close()
        adorsysBlueDark.setFill()
        rletterPath.fill()
        
        
        //// s-letter Drawing
        let sletterPath = UIBezierPath()
        sletterPath.move(to: CGPoint(x: logoletters.minX + 0.69679 * logoletters.width, y: logoletters.minY + 0.64658 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.65132 * logoletters.width, y: logoletters.minY + 0.83465 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.69679 * logoletters.width, y: logoletters.minY + 0.77194 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.68164 * logoletters.width, y: logoletters.minY + 0.83465 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.57363 * logoletters.width, y: logoletters.minY + 0.83465 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.56515 * logoletters.width, y: logoletters.minY + 0.78053 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.56798 * logoletters.width, y: logoletters.minY + 0.83465 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.56515 * logoletters.width, y: logoletters.minY + 0.81663 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.57363 * logoletters.width, y: logoletters.minY + 0.71335 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.56515 * logoletters.width, y: logoletters.minY + 0.73575 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.56798 * logoletters.width, y: logoletters.minY + 0.71335 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.65143 * logoletters.width, y: logoletters.minY + 0.71335 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.67297 * logoletters.width, y: logoletters.minY + 0.64660 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.66578 * logoletters.width, y: logoletters.minY + 0.71335 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.67297 * logoletters.width, y: logoletters.minY + 0.69111 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.67297 * logoletters.width, y: logoletters.minY + 0.62183 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.65338 * logoletters.width, y: logoletters.minY + 0.56194 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.67297 * logoletters.width, y: logoletters.minY + 0.58189 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.66644 * logoletters.width, y: logoletters.minY + 0.56194 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.61607 * logoletters.width, y: logoletters.minY + 0.56194 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.56461 * logoletters.width, y: logoletters.minY + 0.38100 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.58176 * logoletters.width, y: logoletters.minY + 0.56194 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.56461 * logoletters.width, y: logoletters.minY + 0.50161 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.56461 * logoletters.width, y: logoletters.minY + 0.34539 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.59083 * logoletters.width, y: logoletters.minY + 0.19052 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.56461 * logoletters.width, y: logoletters.minY + 0.26497 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.57335 * logoletters.width, y: logoletters.minY + 0.21336 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.63107 * logoletters.width, y: logoletters.minY + 0.17679 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.59786 * logoletters.width, y: logoletters.minY + 0.18136 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.61128 * logoletters.width, y: logoletters.minY + 0.17679 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.63967 * logoletters.width, y: logoletters.minY + 0.23092 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.63681 * logoletters.width, y: logoletters.minY + 0.17679 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.63967 * logoletters.width, y: logoletters.minY + 0.19485 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.63967 * logoletters.width, y: logoletters.minY + 0.24535 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.63107 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.63967 * logoletters.width, y: logoletters.minY + 0.28095 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.63681 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.61454 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.59909 * logoletters.width, y: logoletters.minY + 0.30083 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.60606 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.60091 * logoletters.width, y: logoletters.minY + 0.29946 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.58756 * logoletters.width, y: logoletters.minY + 0.34539 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.59141 * logoletters.width, y: logoletters.minY + 0.30632 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.58756 * logoletters.width, y: logoletters.minY + 0.32113 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.58756 * logoletters.width, y: logoletters.minY + 0.37963 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.59942 * logoletters.width, y: logoletters.minY + 0.43376 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.58756 * logoletters.width, y: logoletters.minY + 0.40797 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.59151 * logoletters.width, y: logoletters.minY + 0.42602 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.61618 * logoletters.width, y: logoletters.minY + 0.43856 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.60239 * logoletters.width, y: logoletters.minY + 0.43697 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.60797 * logoletters.width, y: logoletters.minY + 0.43856 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.65425 * logoletters.width, y: logoletters.minY + 0.43856 * logoletters.height))
        sletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.69679 * logoletters.width, y: logoletters.minY + 0.61637 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.68261 * logoletters.width, y: logoletters.minY + 0.43856 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.69679 * logoletters.width, y: logoletters.minY + 0.49783 * logoletters.height))
        sletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.69679 * logoletters.width, y: logoletters.minY + 0.64658 * logoletters.height))
        sletterPath.close()
        adorsysBlueDark.setFill()
        sletterPath.fill()
        
        
        //// y-letter Drawing
        let yletterPath = UIBezierPath()
        yletterPath.move(to: CGPoint(x: logoletters.minX + 0.84975 * logoletters.width, y: logoletters.minY + 0.18090 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.83985 * logoletters.width, y: logoletters.minY + 0.17679 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.84844 * logoletters.width, y: logoletters.minY + 0.17818 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.84515 * logoletters.width, y: logoletters.minY + 0.17679 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.83126 * logoletters.width, y: logoletters.minY + 0.23092 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.83412 * logoletters.width, y: logoletters.minY + 0.17679 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.83126 * logoletters.width, y: logoletters.minY + 0.19485 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.83126 * logoletters.width, y: logoletters.minY + 0.67741 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.83123 * logoletters.width, y: logoletters.minY + 0.70787 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.76271 * logoletters.width, y: logoletters.minY + 0.70787 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.73389 * logoletters.width, y: logoletters.minY + 0.63249 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.74350 * logoletters.width, y: logoletters.minY + 0.70787 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.73389 * logoletters.width, y: logoletters.minY + 0.68273 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.73389 * logoletters.width, y: logoletters.minY + 0.23092 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.72540 * logoletters.width, y: logoletters.minY + 0.17679 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.73389 * logoletters.width, y: logoletters.minY + 0.19485 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.73106 * logoletters.width, y: logoletters.minY + 0.17679 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.71551 * logoletters.width, y: logoletters.minY + 0.18090 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.72011 * logoletters.width, y: logoletters.minY + 0.17679 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.71680 * logoletters.width, y: logoletters.minY + 0.17818 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.71093 * logoletters.width, y: logoletters.minY + 0.23092 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.71245 * logoletters.width, y: logoletters.minY + 0.18731 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.71093 * logoletters.width, y: logoletters.minY + 0.20396 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.71093 * logoletters.width, y: logoletters.minY + 0.63249 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.76271 * logoletters.width, y: logoletters.minY + 0.82849 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.71093 * logoletters.width, y: logoletters.minY + 0.76318 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.72820 * logoletters.width, y: logoletters.minY + 0.82849 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.83113 * logoletters.width, y: logoletters.minY + 0.82849 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.83104 * logoletters.width, y: logoletters.minY + 0.94515 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.83952 * logoletters.width, y: logoletters.minY + 1.00000 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.83104 * logoletters.width, y: logoletters.minY + 0.98171 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.83387 * logoletters.width, y: logoletters.minY + 1.00000 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.84964 * logoletters.width, y: logoletters.minY + 0.99590 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.84504 * logoletters.width, y: logoletters.minY + 1.00000 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.84841 * logoletters.width, y: logoletters.minY + 0.99863 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.85432 * logoletters.width, y: logoletters.minY + 0.94595 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.85276 * logoletters.width, y: logoletters.minY + 0.98952 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.85432 * logoletters.width, y: logoletters.minY + 0.97287 * logoletters.height))
        yletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.85432 * logoletters.width, y: logoletters.minY + 0.23092 * logoletters.height))
        yletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.84975 * logoletters.width, y: logoletters.minY + 0.18090 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.85432 * logoletters.width, y: logoletters.minY + 0.20442 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.85280 * logoletters.width, y: logoletters.minY + 0.18779 * logoletters.height))
        yletterPath.close()
        adorsysBlueDark.setFill()
        yletterPath.fill()
        
        
        //// 2nd-s-letter Drawing
        let _2ndsletterPath = UIBezierPath()
        _2ndsletterPath.move(to: CGPoint(x: logoletters.minX + 1.00000 * logoletters.width, y: logoletters.minY + 0.64658 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.95453 * logoletters.width, y: logoletters.minY + 0.83465 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 1.00000 * logoletters.width, y: logoletters.minY + 0.77194 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.98484 * logoletters.width, y: logoletters.minY + 0.83465 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.87684 * logoletters.width, y: logoletters.minY + 0.83465 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.86835 * logoletters.width, y: logoletters.minY + 0.78053 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.87119 * logoletters.width, y: logoletters.minY + 0.83465 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.86835 * logoletters.width, y: logoletters.minY + 0.81663 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.87684 * logoletters.width, y: logoletters.minY + 0.71335 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.86835 * logoletters.width, y: logoletters.minY + 0.73575 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.87119 * logoletters.width, y: logoletters.minY + 0.71335 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.95463 * logoletters.width, y: logoletters.minY + 0.71335 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.97617 * logoletters.width, y: logoletters.minY + 0.64660 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.96900 * logoletters.width, y: logoletters.minY + 0.71335 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.97617 * logoletters.width, y: logoletters.minY + 0.69111 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.97617 * logoletters.width, y: logoletters.minY + 0.62183 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.95658 * logoletters.width, y: logoletters.minY + 0.56194 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.97617 * logoletters.width, y: logoletters.minY + 0.58189 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.96964 * logoletters.width, y: logoletters.minY + 0.56194 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.91927 * logoletters.width, y: logoletters.minY + 0.56194 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.86781 * logoletters.width, y: logoletters.minY + 0.38100 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.88497 * logoletters.width, y: logoletters.minY + 0.56194 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.86781 * logoletters.width, y: logoletters.minY + 0.50161 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.86781 * logoletters.width, y: logoletters.minY + 0.34539 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.89403 * logoletters.width, y: logoletters.minY + 0.19052 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.86781 * logoletters.width, y: logoletters.minY + 0.26497 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.87656 * logoletters.width, y: logoletters.minY + 0.21336 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.93429 * logoletters.width, y: logoletters.minY + 0.17679 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.90107 * logoletters.width, y: logoletters.minY + 0.18136 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.91449 * logoletters.width, y: logoletters.minY + 0.17679 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.94288 * logoletters.width, y: logoletters.minY + 0.23092 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.94001 * logoletters.width, y: logoletters.minY + 0.17679 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.94288 * logoletters.width, y: logoletters.minY + 0.19485 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.94288 * logoletters.width, y: logoletters.minY + 0.24535 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.93429 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.94288 * logoletters.width, y: logoletters.minY + 0.28095 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.94001 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.91774 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.90229 * logoletters.width, y: logoletters.minY + 0.30083 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.90926 * logoletters.width, y: logoletters.minY + 0.29875 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.90412 * logoletters.width, y: logoletters.minY + 0.29946 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.89077 * logoletters.width, y: logoletters.minY + 0.34539 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.89462 * logoletters.width, y: logoletters.minY + 0.30632 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.89077 * logoletters.width, y: logoletters.minY + 0.32113 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.89077 * logoletters.width, y: logoletters.minY + 0.37963 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.90263 * logoletters.width, y: logoletters.minY + 0.43376 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.89077 * logoletters.width, y: logoletters.minY + 0.40797 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.89472 * logoletters.width, y: logoletters.minY + 0.42602 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 0.91938 * logoletters.width, y: logoletters.minY + 0.43856 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.90560 * logoletters.width, y: logoletters.minY + 0.43697 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 0.91118 * logoletters.width, y: logoletters.minY + 0.43856 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 0.95746 * logoletters.width, y: logoletters.minY + 0.43856 * logoletters.height))
        _2ndsletterPath.addCurve(to: CGPoint(x: logoletters.minX + 1.00000 * logoletters.width, y: logoletters.minY + 0.61637 * logoletters.height), controlPoint1: CGPoint(x: logoletters.minX + 0.98582 * logoletters.width, y: logoletters.minY + 0.43856 * logoletters.height), controlPoint2: CGPoint(x: logoletters.minX + 1.00000 * logoletters.width, y: logoletters.minY + 0.49783 * logoletters.height))
        _2ndsletterPath.addLine(to: CGPoint(x: logoletters.minX + 1.00000 * logoletters.width, y: logoletters.minY + 0.64658 * logoletters.height))
        _2ndsletterPath.close()
        adorsysBlueDark.setFill()
        _2ndsletterPath.fill()
    }
}
