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
            topLeft: normalize(topLeft.yAxisInverted(source.height)),
            topRight: normalize(topRight.yAxisInverted(source.height)),
            bottomLeft: normalize(bottomLeft.yAxisInverted(source.height)),
            bottomRight: normalize(bottomRight.yAxisInverted(source.height))
        )
    }
}

extension CGRect {
    func normalized(source: CGSize, target: CGSize) -> CGRect {
        let normalize = normalizer(from: source, to: target)

        let normalizedOrigin = normalize(origin)
        let point = normalize(CGPoint(x: size.width, y: size.height))
        let normalizedSize = CGSize(width: point.x, height: point.y)

        return CGRect(origin: normalizedOrigin, size: normalizedSize)
    }
}

private func normalizer(from source: CGSize, to target: CGSize) -> (CGPoint) -> CGPoint {// Since the source and target sizes have different aspect ratios,
    // source must be normalized. It behaves like
    // `UIView.ContentMode.aspectFill`, truncating portions that don't fit
    let normalizedSource = CGSize(width: source.height * target.aspectRatio,
                                  height: source.height)
    let xShift = (normalizedSource.width - source.width) / 2
    let yShift = (normalizedSource.height - source.height) / 2

    let distortion = CGVector(dx: target.width / normalizedSource.width,
                              dy: target.height / normalizedSource.height)

    return { point in
        return point
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
