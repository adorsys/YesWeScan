//
//  TextRecognizer.swift
//  DocumentScanner
//
//  Created by Xaver Lohmüller on 13.07.18.
//

import CoreImage

final class TextRecognizer {

    private let detector: CIDetector

    init(context: CIContext? = nil) {
        detector = CIDetector(ofType: CIDetectorTypeText, context: context, options: [
            CIDetectorAccuracy: CIDetectorAccuracyHigh,
            CIDetectorMaxFeatureCount: 25
        ])!
    }

    func detectText(in image: CIImage) -> ([RectangleFeature], [CIImage]) {
        let textFeatures = detector.features(in: image)
            .compactMap { $0 as? CITextFeature }

        let boundingRects = textFeatures
            .map(RectangleFeature.init)
            .map {
                $0.normalized(source: image.extent.size,
                              target: UIScreen.main.bounds.size)
            }

        let images = textFeatures
            .map { image
                .cropped(to: $0.bounds)
                .applyingFilter("CIPerspectiveCorrection", parameters: [
                    "inputTopLeft": CIVector(cgPoint: $0.topLeft),
                    "inputTopRight": CIVector(cgPoint: $0.topRight),
                    "inputBottomLeft": CIVector(cgPoint: $0.bottomLeft),
                    "inputBottomRight": CIVector(cgPoint: $0.bottomRight)
                ])
            }

        return (boundingRects, images)
    }
}
