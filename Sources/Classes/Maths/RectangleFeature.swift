import UIKit

struct RectangleFeature {
    let topLeft: CGPoint
    let topRight: CGPoint
    let bottomLeft: CGPoint
    let bottomRight: CGPoint

    init(topLeft: CGPoint = .zero,
         topRight: CGPoint = .zero,
         bottomLeft: CGPoint = .zero,
         bottomRight: CGPoint = .zero) {
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomLeft = bottomLeft
        self.bottomRight = bottomRight
    }
}

extension RectangleFeature {
    init(_ rectangleFeature: CIRectangleFeature) {
        topLeft = rectangleFeature.topLeft
        topRight = rectangleFeature.topRight
        bottomLeft = rectangleFeature.bottomLeft
        bottomRight = rectangleFeature.bottomRight
    }

    func smoothed(with previous: [RectangleFeature]) -> (RectangleFeature, [RectangleFeature]) {

        let allFeatures = [self] + previous
        let smoothed = allFeatures.average

        return (smoothed, Array(allFeatures.prefix(10)))
    }

    var bezierPath: UIBezierPath {

        let path = UIBezierPath()
        path.move(to: topLeft)
        path.addLine(to: topRight)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        path.close()

        return path
    }

    func difference(to: RectangleFeature) -> CGFloat {
            return
                abs(to.topLeft - topLeft) +
                abs(to.topRight - topRight) +
                abs(to.bottomLeft - bottomLeft) +
                abs(to.bottomRight - bottomRight)
    }

    /// This isn't the real area, but enables correct comparison
    private var areaQualifier: CGFloat {
        let diagonalToLeft = (topRight - bottomLeft)
        let diagonalToRight = (topLeft - bottomRight)
        let phi = diagonalToLeft.x * diagonalToRight.x + diagonalToLeft.y * diagonalToRight.y / (diagonalToLeft.length * diagonalToRight.length)
        return sqrt(1 - phi * phi) * diagonalToLeft.length * diagonalToRight.length
    }
}

extension RectangleFeature: Comparable {
    static func < (lhs: RectangleFeature, rhs: RectangleFeature) -> Bool {
        return lhs.areaQualifier < rhs.areaQualifier
    }

    static func == (lhs: RectangleFeature, rhs: RectangleFeature) -> Bool {
        return lhs.topLeft == rhs.topLeft
            && lhs.topRight == rhs.topRight
            && lhs.bottomLeft == rhs.bottomLeft
            && lhs.bottomRight == rhs.bottomRight
    }
}

private extension CGPoint {
    var length: CGFloat {
        return sqrt(x * x + y * y)
    }
}
