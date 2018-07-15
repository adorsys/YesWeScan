//
//  TextRecognizer.swift
//  DocumentScanner
//
//  Created by Xaver Lohmüller on 13.07.18.
//

import Vision

struct TextRecognizer {

    private let context: CIContext

    init(context: CIContext? = nil) {
        self.context = context ?? CIContext()
    }

    @available(iOS 11.0, *)
    func detectText(in image: CIImage, completion: @escaping ([CGRect]) -> Void) {

        let handler = VNImageRequestHandler(ciImage: image, orientation: .downMirrored, options: [.ciContext: context])
        let request = VNDetectTextRectanglesRequest { request, error in
            guard error == nil, let results = request.results as? [VNTextObservation]
                else { return }
            let distortion = image.extent.size
            let boxes = results
                .map { $0.boundingBox }
                .map { CGRect(x: $0.origin.x * distortion.width,
                              y: $0.origin.y * distortion.height,
                              width: $0.size.width * distortion.width,
                              height: $0.size.height * distortion.height)

                }

            DispatchQueue.main.async {
                completion(boxes)
            }
        }
        try? handler.perform([request])
    }
}
