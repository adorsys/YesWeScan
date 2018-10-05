//
//  RectRecognizer.swift
//  DocumentScanner
//
//  Created by Xaver Lohmüller on 15.07.18.
//

import CoreImage

final class RectRecognizer {

    private let detector: CIDetector
    private var lastFeatures: [RectangleFeature] = []

    var jitter: CGFloat {
        return lastFeatures.count > 7 ? lastFeatures.jitter : .greatestFiniteMagnitude
    }

    init(context: CIContext? = nil) {
        detector = CIDetector(ofType: CIDetectorTypeRectangle, context: context, options: [
            CIDetectorAccuracy: CIDetectorAccuracyHigh,
            CIDetectorMaxFeatureCount: 10
        ])!
    }

    func detectRect(in image: CIImage) -> RectangleFeature? {
        let maxFeature = detector.features(in: image)
            .compactMap { $0 as? CIRectangleFeature }
            .map(RectangleFeature.init)
            .max()
        guard let normalized = maxFeature?
            .normalized(source: image.extent.size,
                        target: UIScreen.main.bounds.size)
            else { return nil }

        return smooth(feature: normalized)
    }

    private func smooth(feature: RectangleFeature) -> (RectangleFeature) {
        let (smoothed, newFeatures) = feature.smoothed(with: lastFeatures)
        lastFeatures = newFeatures
        return smoothed
    }
}
