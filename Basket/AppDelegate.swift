//
//  AppDelegate.swift
//  Basket
//
//  Created by Andrei Vidrasco on 23/06/2017.
//  Copyright © 2017 Andrei Vidrasco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ProductsListController().initialViewController()
        window.makeKeyAndVisible()
        self.window = window
        
        // Override point for customization after application launch.
        return true
    }
}

