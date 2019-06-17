//
//  BridgeManager.swift
//  ReactNativeEventBridgeSwift
//
//  Created by Michael Schneider
//  Copyright © 2017 mischneider. All rights reserved.
//

import Foundation
import React

final class BridgeManager: NSObject {
    static let shared = BridgeManager()
    
    static func setup() {
        shared._bridge = RCTBridge(delegate: shared, launchOptions: [:])
    }
    
    private var _bridge: RCTBridge!
    static var bridge: RCTBridge {
        precondition(shared._bridge != nil, "You must call setup() first")
        return shared._bridge
    }
}

extension BridgeManager: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        return RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index.ios", fallbackResource: nil)
    }
    
    func extraModules(for bridge: RCTBridge!) -> [RCTBridgeModule]! {
        return []
    }
}

