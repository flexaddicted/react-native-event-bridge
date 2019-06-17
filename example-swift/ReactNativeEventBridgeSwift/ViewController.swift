//
//  ViewController.swift
//  ReactNativeEventBridgeSwift
//
//  Created by Michael Schneider
//  Copyright © 2017 mischneider. All rights reserved.
//

import UIKit
import MSREventBridge

// MARK: ViewController

class ViewController: UIViewController {
    
    override func loadView() {        
        let rootView = RCTRootView(bridge: BridgeManager.bridge,
                                   moduleName: "ReactNativeEventBridgeSwift",
                                   initialProperties: nil)
        rootView?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Swift Example"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Send Native Event", style: .plain, target:self, action: #selector(ViewController.sendEvent))
    }
    
}

// MARK: MSREventBridgeEventReceiver

extension ViewController: MSREventBridgeEventReceiver {
    
    // MARK: Handle events from RN
    
    func onEvent(withName name: String!, info: [AnyHashable : Any]!) {
        print("Received event: \(name as Optional) with info \(info as Optional)")
    }
    
    func onEvent(withName name: String!, info: [AnyHashable : Any]!, callback: RCTResponseSenderBlock!) {
        print("Received event with callback: \(name as Optional) with info \(info as Optional)")
        callback([])
    }
}

// MARK: Sending Events

extension ViewController {
    @objc func sendEvent() {
        if let rootView = self.view as? RCTRootView,
            let bridge = rootView.bridge {
            // Send an event to components subscribed in the root view
            bridge.viewControllerEventEmitter.emitEvent(for: rootView, name: "EventName", info: [:])
        }
    }
}
