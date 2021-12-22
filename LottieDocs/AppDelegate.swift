//
//  AppDelegate.swift
//  LottieDocs
//
//  Created by AD0507-ADE-MB-1 on 22/12/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static func displayWindow(_ window: UIWindow) {
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {} else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            
            AppDelegate.displayWindow(window)
            
            self.window = window
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default", sessionRole: connectingSceneSession.role)
    }
}
