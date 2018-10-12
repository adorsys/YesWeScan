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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if #available(iOS 12.0, *) {
            if userActivity.activityType == Bundle.main.userActivityIdentifier {
                let navigationController = window?.rootViewController! as! UINavigationController
                let viewController = navigationController.children.first as! ViewController
                viewController.openDocumentScanner()
            }
            return true
        } else {
            return false
        }
    }

}
