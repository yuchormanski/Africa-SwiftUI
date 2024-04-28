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
    let haptic = UIImpactFeedbackGenerator(style: .medium)

    @State private var isGridViewActive: Bool = false
    //BASIC GRID LAYOUT
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MARK: - FUNCTIONS
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        
//        From lecture
//        switch gridColumn {
//        case 1:
//            toolbarIcon = "square.grid.2x2"
//        case 2:
//            toolbarIcon = "square.grid.3x2"
//        case 3:
//            toolbarIcon = "rectangle.grid.1x2"
//        default:
//            toolbarIcon = "square.grid.2x2"
//        }
        
        if (gridColumn == 2){
            toolbarIcon = "square.grid.3x2"
        } else if (gridColumn == 3){
            toolbarIcon = "rectangle.grid.1x2"
        } else {
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal),
                                label: {
                                    AnimalListItemView(animal: animal)
                                })
                        }//: Loop
                    }//: List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal),
                                    label: {
                                        AnimalGridItemView(animal: animal)
                                    })//: Link
                            }//: Loop
                        }//: Grid
                        .padding(10)
                        .animation(.easeIn, value: isGridViewActive)
                    }//: Scroll
                }//: Condition
            }//: Group
            
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    HStack(spacing: 16){
                        //List layout
                        Button(action: {
                            print("Button pressed")
                            isGridViewActive = false
                            haptic.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title3)
                                .foregroundStyle(isGridViewActive ?  Color.primary : .accent )
                        })
                        
                        //Grid layout
                        Button(action: {
                            gridSwitch()
                            isGridViewActive = true
                            haptic.impactOccurred()
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ?  .accent : Color.primary)
                        })
                    }
                }// Toolbar Button
            }//: Toolbar
        }//: Navigation
    }
}

//MARK: - PREVIEW
#Preview {
    ContentView()
}
