//
//  AppDelegate.swift
//  sugumogu
//
//  Created by taakashi on 2024/06/30.
//

import Foundation
import GoogleMaps

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GMSServices.provideAPIKey("AIzaSyDAzPN0sZrU-P2qxuY_2Je8rPnFN3SmZ3g")
        return true
    }
}
