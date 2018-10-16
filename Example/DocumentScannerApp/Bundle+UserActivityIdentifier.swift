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
        guard let nsUserActivityTypes = object(forInfoDictionaryKey: "NSUserActivityTypes") as? [String],
            let activityId = nsUserActivityTypes.first else {
            fatalError("Need to declare at least one NSUserActivityTypes in your info.plist")
        }
        return activityId
    }
}
