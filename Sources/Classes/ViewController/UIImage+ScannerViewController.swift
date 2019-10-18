//
//  UIImage+ScannerViewController.swift
//  DocumentScanner
//
//  Created by Xaver Lohmueller on 26.09.17.
//

import UIKit

private var bundle: Bundle {
    return Bundle(for: ScannerViewController.self)
}

extension UIImage {
    static let torchImage = UIImage(named: "Torch", in: bundle, compatibleWith: nil)
}
