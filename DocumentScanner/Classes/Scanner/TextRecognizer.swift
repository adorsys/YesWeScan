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

    func detectText(in image: CIImage) -> [RectangleFeature] {
        return detector.features(in: image)
            .compactMap { $0 as? CITextFeature }
            .map(RectangleFeature.init)
            .map {
                $0.normalized(source: image.extent.size,
                              target: UIScreen.main.bounds.size)
            }
    }
}
