//
//  AppDelegate.swift
//  TechGropseAssignment
//
//  Created by Admin on 25/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var nav = UINavigationController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSPlacesClient.provideAPIKey("AIzaSyCgJ4YeArNJyEuox-Htp6Mo1jlCM-U_ljg")
        GMSServices.provideAPIKey("AIzaSyCgJ4YeArNJyEuox-Htp6Mo1jlCM-U_ljg")
        setRootViewController()
        return true
    }

}
extension AppDelegate{
    func setRootViewController() {
        let eventDetailsVC = EventDetailRouter.createEventDetailsViewController()
        let navigationController = UINavigationController(rootViewController: eventDetailsVC)
        navigationController.isNavigationBarHidden = false

         navigationController.interactivePopGestureRecognizer?.isEnabled = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

