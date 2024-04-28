//
//  MapView.swift
//  Africa-SwiftUI
//
//  Created by Nikolay  Yuchormanski on 27.04.24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //MARK: - PROPERTIES
    
    //Deprecated in iOS 17
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599) // coordinates of the map
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0) // zoom level of the map
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel) // actual map region
        return mapRegion
    }()
    @State private var latitude: Double?
    @State private var longitude: Double?
    
    //iOS 17+
    //    @State private var region: MapCameraPosition = {
    //        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    //        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    //        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
    //        return MapCameraPosition.region(mapRegion)
    //    }()
    
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    
    //MARK: - BODY
    var body: some View {
        // 1. Basic MAP
        //        Map(position: $region)
        
        // 2. Map wit anotations
        Map(coordinateRegion: $region,  annotationItems: locations, annotationContent: {
            item in
            // (A) PIN: Old style (always static)
            //            MapPin(coordinate: item.location, tint: .accentColor)
            //            (B) Marker: New style (always static)
            //            MapMarker(coordinate: item.location, tint: .accentColor)
            //            (C) Custom basic annotation (it could be interactive)
            //            MapAnnotation(coordinate: item.location){
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 32, height: 32, alignment: .center)
            //            }//: Annotations
            
            //            (D) Custom advanced annotation (it could be interactive)
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
        })//: MAP
        .overlay(
            HStack (alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48,height: 48, alignment: .center)
                    .opacity(0.6)

                VStack (alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                            .opacity(0.8)
                    }//: HStack
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                            .opacity(0.8)
                    }

                }
            }//:HStack
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .opacity(0.6)
                        .cornerRadius(8)
                )
                .padding()
            , alignment: .top
            
            
        )
        
    }
}

//MARK: - PREVIEW
//#Preview {
//    MapView()
//}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
