//
//  AppDelegate.swift
//  To_Do_List
//
//  Created by Macbook Air on 13/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        let vc = WalkVC.init(nibName: "WalkVC", bundle: nil)
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
        
        return true
    }

}

