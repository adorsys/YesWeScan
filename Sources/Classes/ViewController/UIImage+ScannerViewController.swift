//
//  UIImage+ScannerViewController.swift
//  DocumentScanner
//
//  Created by Xaver Lohmueller on 26.09.17.
//

import UIKit

extension UIImage {
    static let buttonImage = loadAsset(named: "CaptureButton")

    static let targetBracesToggleImage = loadAsset(named: "FocusIndicator")

    static let torchImage = loadAsset(named: "Torch")

    private static func loadAsset(named: String) -> UIImage {
        let outerBundle = Bundle(for: ScannerViewController.self)
        let bundle = Bundle(url: outerBundle.url(forResource: "Assets", withExtension: "bundle")!)
        return UIImage(named: named, in: bundle, compatibleWith: nil)!
    }
}
