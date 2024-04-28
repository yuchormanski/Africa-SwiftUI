//
//  LocationModel.swift
//  Africa-SwiftUI
//
//  Created by Nikolay  Yuchormanski on 28.04.24.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    //Computed prop
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
