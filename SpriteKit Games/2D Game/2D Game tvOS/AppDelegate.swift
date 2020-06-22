//
//  AppDelegate.swift
//  2D Game tvOS
//
//  Created by Caleb Wells on 4/24/20.
//  Copyright © 2020 Caleb Wells. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = GameViewController()
        
        return true
    }
}
