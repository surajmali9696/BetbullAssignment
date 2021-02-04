//
//  AppDelegate.swift
//  Betbull
//
//  Created by Betbull on 7.09.2020.
//  Copyright © 2020 Betbull. All rights reserved.
//

import UIKit

@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {
    public var window: UIWindow?
    
    
    private var token: WebSocketClient.Token!
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        WebSocketClient.shared.connect()
        
         token = WebSocketClient.shared.register { payload in
              print("Received: \(payload)")
        }
        return true
    }
}
