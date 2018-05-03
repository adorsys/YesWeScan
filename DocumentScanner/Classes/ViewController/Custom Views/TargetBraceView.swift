import UIKit

final class TargetBraceView: UIView {
    var color: UIColor = .red

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineWidth(2 * UIScreen.main.scale)
        context.setStrokeColor(color.cgColor)
        context.setLineJoin(.bevel)
        context.setLineCap(.square)

        let braceLength = bounds.width * 0.15

        var origin: CGPoint

        // Top Left
        origin = bounds.origin
        context.addLines(between: [origin, origin + CGPoint(x: braceLength, y: 0)])
        context.addLines(between: [origin, origin + CGPoint(x: 0, y: braceLength)])

        // Top Right
        origin = bounds.origin + CGPoint(x: bounds.width, y: 0)
        context.addLines(between: [origin, origin - CGPoint(x: braceLength, y: 0)])
        context.addLines(between: [origin, origin + CGPoint(x: 0, y: braceLength)])

        // Bottom Left
        origin = bounds.origin + CGPoint(x: 0, y: bounds.height)
        context.addLines(between: [origin, origin + CGPoint(x: braceLength, y: 0)])
        context.addLines(between: [origin, origin - CGPoint(x: 0, y: braceLength)])

        // Bottom Right
        origin = bounds.origin + CGPoint(x: bounds.width, y: bounds.height)
        context.addLines(between: [origin, origin - CGPoint(x: braceLength, y: 0)])
        context.addLines(between: [origin, origin - CGPoint(x: 0, y: braceLength)])

        context.strokePath()
    }
}
