//
//  MapView.swift
//  sugumogu
//
//  Created by taakashi on 2024/06/30.
//

import SwiftUI
import GoogleMaps

struct MapView: UIViewRepresentable {
    let mapView = GMSMapView(frame: .zero)
        
    func makeUIView(context: Context) -> GMSMapView {
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {
    }
}

#Preview {
    MapView()
}
