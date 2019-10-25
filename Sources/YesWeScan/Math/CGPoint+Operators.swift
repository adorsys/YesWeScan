import CoreGraphics

extension CGPoint {
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x,
                       y: lhs.y + rhs.y)
    }

    static func += (lhs: inout CGPoint, rhs: CGPoint) {
        lhs = lhs + rhs // swiftlint:disable:this shorthand_operator
    }

    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x,
                       y: lhs.y - rhs.y)
    }

    static func / (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x / rhs,
                       y: lhs.y / rhs)
    }
}

func abs(_ point: CGPoint) -> CGFloat {
    return abs(point.x) + abs(point.y)
}

extension RectangleFeature {
    static func + (lhs: RectangleFeature, rhs: RectangleFeature) -> RectangleFeature {
        return RectangleFeature(topLeft: lhs.topLeft + rhs.topLeft,
                                topRight: lhs.topRight + rhs.topRight,
                                bottomLeft: lhs.bottomLeft + rhs.bottomLeft,
                                bottomRight: lhs.bottomRight + rhs.bottomRight)
    }

    static func / (lhs: RectangleFeature, rhs: CGFloat) -> RectangleFeature {
        return RectangleFeature(topLeft: lhs.topLeft / rhs,
                                topRight: lhs.topRight / rhs,
                                bottomLeft: lhs.bottomLeft / rhs,
                                bottomRight: lhs.bottomRight / rhs)
    }
}
