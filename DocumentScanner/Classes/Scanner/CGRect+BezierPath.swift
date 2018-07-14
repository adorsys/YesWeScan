//
//  CGRect+BezierPath.swift
//  DocumentScanner
//
//  Created by Xaver Lohmüller on 14.07.18.
//

import UIKit

extension CGRect {
    var bezierPath: UIBezierPath {

        let path = UIBezierPath()
        path.move(to: origin)
        path.addLine(to: origin + CGPoint(x: size.width, y: 0))
        path.addLine(to: origin + CGPoint(x: size.width, y: size.height))
        path.addLine(to: origin + CGPoint(x: 0, y: size.height))
        path.close()

        return path
    }
}
