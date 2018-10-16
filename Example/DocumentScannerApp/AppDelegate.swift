//
//  AppDelegate.swift
//  DocumentScannerApp
//
//  Created by Steff Blümm on 30.04.18.
//  Copyright © 2018 Steff Blümm. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // swiftlint:disable:next discouraged_optional_collection
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        return true
    }

    // swiftlint:disable:next discouraged_optional_collection
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if #available(iOS 12.0, *) {
            guard userActivity.activityType == Bundle.main.userActivityIdentifier,
                let navigationController = window?.rootViewController! as? UINavigationController,
                let viewController = navigationController.children.first as? ViewController else {
                    return false
            }
            viewController.openDocumentScanner()
            return true
        } else {
            return false
        }
    }

}
