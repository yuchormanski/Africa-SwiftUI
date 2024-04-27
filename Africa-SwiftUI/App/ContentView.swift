//
//  ContentView.swift
//  Africa-SwiftUI
//
//  Created by Nikolay  Yuchormanski on 27.04.24.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                ForEach(animals) {animal in
                    NavigationLink(
                        destination: AnimalDetailView(animal: animal),
                        label: {
                            AnimalListItemView(animal: animal)
                        })
                }
            }//: List
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            
            
        }//: Navigation
    }
}

//MARK: - PREVIEW
#Preview {
    ContentView()
}
