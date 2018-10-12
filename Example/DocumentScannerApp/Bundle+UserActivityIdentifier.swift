//
//  Bundle+UserActivityIdentifier.swift
//  DocumentScannerApp
//
//  Created by Tim Abraham on 12.10.18.
//  Copyright © 2018 Steff Blümm. All rights reserved.
//

import Foundation

extension Bundle {
    var userActivityIdentifier: String {
        let nsUserActivityTypes = Bundle.main.object(forInfoDictionaryKey: "NSUserActivityTypes")! as! [String]
        return nsUserActivityTypes.first!
    }
}
