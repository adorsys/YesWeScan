//
//  Normalization.swift
//  DocumentScanner
//
//  Created by Xaver Lohmüller on 14.07.18.
//

import Foundation

extension RectangleFeature {
    func normalized(source: CGSize, target: CGSize) -> RectangleFeature {
        let normalize = normalizer(from: source, to: target)

        return RectangleFeature(
            topLeft: normalize(topLeft),
            topRight: normalize(topRight),
            bottomLeft: normalize(bottomLeft),
            bottomRight: normalize(bottomRight)
        )
    }
}

private func normalizer(from source: CGSize, to target: CGSize) -> (CGPoint) -> CGPoint {
    // Since the source and target sizes have different aspect ratios,
    // source must be normalized. It behaves like
    // `UIView.ContentMode.aspectFill`, truncating portions that don't fit
    let normalizedSource = CGSize(width: source.height * target.aspectRatio,
                                  height: source.height)
    let xShift = (normalizedSource.width - source.width) / 2
    let yShift = (normalizedSource.height - source.height) / 2

    let distortion = CGVector(dx: target.width / normalizedSource.width,
                              dy: target.height / normalizedSource.height)

    return { point in
        point
            .yAxisInverted(source.height)
            .shifted(by: CGPoint(x: xShift, y: yShift))
            .distorted(by: distortion)
    }
}

private extension CGSize {
    var aspectRatio: CGFloat {
        return width / height
    }
}

private extension CGPoint {
    func distorted(by distortion: CGVector) -> CGPoint {
        return CGPoint(x: x * distortion.dx, y: y * distortion.dy)
    }

    func yAxisInverted(_ maxY: CGFloat) -> CGPoint {
        return CGPoint(x: x, y: maxY - y)
    }

    func shifted(by shiftAmount: CGPoint) -> CGPoint {
        return CGPoint(x: x + shiftAmount.x, y: y + shiftAmount.y)
    }
}
