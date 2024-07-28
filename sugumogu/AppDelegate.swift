//
//  AppDelegate.swift
//  sugumogu
//
//  Created by taakashi on 2024/06/30.
//

import Foundation
import UIKit
import GoogleMaps
import CoreLocation

class AppDelegate: NSObject, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    let locationManager = CLLocationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyDAzPN0sZrU-P2qxuY_2Je8rPnFN3SmZ3g")
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        return true
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        } else if status == .denied || status == .restricted {
            showLocationAccessDeniedAlert()
        }
    }

    private func showLocationAccessDeniedAlert() {
        guard let window = window else { return }
        let alertController = UIAlertController(
            title: "Location Access Denied",
            message: "Please enable location services in Settings to use this feature.",
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings)
            }
        }))
        window.rootViewController?.present(alertController, animated: true, completion: nil)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Current location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
            // 必要に応じて他の処理を追加
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
        // 必要に応じて他のエラーハンドリングを追加
    }
}
