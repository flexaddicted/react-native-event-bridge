//
//  AppDelegate.swift
//  ReactNativeEventBridgeSwift
//
//  Created by Michael Schneider
//  Copyright © 2017 mischneider. All rights reserved.
//

import UIKit
import React

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: ViewController())
        self.window?.makeKeyAndVisible()
        
        BridgeManager.setup()
       
        return true
    }
}

