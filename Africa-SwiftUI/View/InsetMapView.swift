//
//  InsetMapView.swift
//  Africa-SwiftUI
//
//  Created by Nikolay  Yuchormanski on 27.04.24.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    //MARK: - PROPERTIES
    let animal: Animal
    
    // Deprecated in iOS 17.0
//    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    // iOS 17+
    @State private var region = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599),
        span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
    ))
    
    //MARK: - BODY
    var body: some View {
//        deprecated in iOS 17.0
//        Map(coordinateRegion: $region)
        
        //iOS 17+
        Map(position: $region)
            .overlay(
                NavigationLink(destination: MapView()){
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundStyle(.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundStyle(Color.accentColor)
                            .fontWeight(.bold)
                        
                    }//: HStack
                    .padding(.vertical,10)
                    .padding(.horizontal,14)
                    .background(.black.opacity(0.4) .opacity(8))
                
                }//: Navigation
                    .padding(12)
                , alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
        
    }
}

//MARK: - PREVIEW
//#Preview {
//    InsetMapView()
//}
struct InsetMapView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetMapView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
