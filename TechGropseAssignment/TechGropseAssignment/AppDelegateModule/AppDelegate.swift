//
//  AppDelegate.swift
//  TechGropseAssignment
//
//  Created by Admin on 25/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var nav = UINavigationController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

}
extension AppDelegate{
    func setRootViewController() {
//        let getRootOfAuthModule = ChooseLangaugeRouter.pushToChooseLanguageviewController()
//        let navigationController = UINavigationController(rootViewController: getRootOfAuthModule)
//        navigationController.isNavigationBarHidden = false
//
//         navigationController.interactivePopGestureRecognizer?.isEnabled = true
//        window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = navigationController
//        window?.makeKeyAndVisible()
    }
}

