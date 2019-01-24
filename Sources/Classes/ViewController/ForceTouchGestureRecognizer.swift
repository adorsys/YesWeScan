//
//  ForceTouchGestureRecognizer.swift
//  DocumentScanner
//
//  Created by Xaver Lohmueller on 26.09.17.
//

// From https://krakendev.io/force-touch-recognizers/

// Without this import line, you'll get compiler errors when implementing your
// touch methods since they aren't part of the UIGestureRecognizer superclass
import UIKit.UIGestureRecognizerSubclass

final class ForceTouchGestureRecognizer: UIGestureRecognizer {

    private(set) var force: CGFloat = 0.0
    var maximumForce: CGFloat = 4.0

    convenience init() {
        self.init(target: nil, action: nil)
    }

    // We override the initializer because UIGestureRecognizer's
    // cancelsTouchesInView property is true by default. If you were to, say,
    // add this recognizer to a tableView's cell, it would prevent
    // didSelectRowAtIndexPath from getting called.
    // Thanks for finding this bug, Jordan Hipwell!
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        cancelsTouchesInView = false
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        normalizeForceAndFireEvent(.began, touches: touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        normalizeForceAndFireEvent(.changed, touches: touches)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        normalizeForceAndFireEvent(.ended, touches: touches)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        normalizeForceAndFireEvent(.cancelled, touches: touches)
    }

    private func normalizeForceAndFireEvent(_ state: UIGestureRecognizer.State, touches: Set<UITouch>) {
        guard let firstTouch = touches.first else { return }

        maximumForce = min(firstTouch.maximumPossibleForce, maximumForce)

        force = firstTouch.force / maximumForce

        // Our properties are now ready for inspection by the developer.
        // By setting the UIGestureRecognizer's state property, the system will
        // automatically send the target the selector message that this
        // recognizer was initialized with.
        self.state = state
    }

    override func reset() {
        super.reset()
        force = 0.0
    }
}
