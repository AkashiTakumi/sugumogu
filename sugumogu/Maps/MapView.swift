//
//  MapView.swift
//  sugumogu
//
//  Created by taakashi on 2024/06/30.
//

import SwiftUI
import GoogleMaps
import CoreLocation

struct MapView: UIViewRepresentable {
    let mapView = GMSMapView()
    let locationManager = CLLocationManager()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> GMSMapView {
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        locationManager.delegate = context.coordinator
        locationManager.requestWhenInUseAuthorization()
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {
    }
    
    class Coordinator: NSObject, CLLocationManagerDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                parent.locationManager.startUpdatingLocation()
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
                let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                                      longitude: location.coordinate.longitude,
                                                      zoom: 15)
                parent.mapView.animate(to: camera)
                parent.locationManager.stopUpdatingLocation()
            }
        }
    }
}

#Preview {
    MapView()
}
