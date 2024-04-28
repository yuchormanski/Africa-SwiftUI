//
//  GalleryView.swift
//  Africa-SwiftUI
//
//  Created by Nikolay  Yuchormanski on 27.04.24.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    ////Simple grid definition
    //let gridLayout: [GridItem] = [
    //    GridItem(.flexible()),
    //    GridItem(.flexible()),
    //    GridItem(.flexible())
    //]
    
    // Efficient Grid definition
    //    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    // Dynamic grid layout
    
    @State private var selectedAnimal: String = "lion"
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    @State private var gridFixer: Double = 3.0
    
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: .init(gridColumn))
    }
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack (alignment: .center, spacing: 30){
                //MARK: - IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                
                // FROM LECTURE
                //.clipShape(Capsule())
                //.overlay(Capsule().stroke(Color.white.opacity(0.8), lineWidth: 8))
                
                //CUSTOM DESIGN it looks better to me
                    .clipShape(RoundedRectangle(cornerSize:CGSize(
                                                        width: 10,
                                                        height: 10)))
                    .overlay(
                        RoundedRectangle(cornerSize:CGSize(
                                                width: 10,
                                                height: 10)).stroke(.accent.opacity(0.8), lineWidth: 3)
                    )
                //MARK: - SLIDER
                
                Slider(value: $gridColumn, in: 2 ... 4, step: 1 )
                    .padding(.horizontal)
                
                //                   Deprecated in iOS 17
                //                    .onChange(of: gridColumn, perform: { value in
                //                        gridSwitch()
                //                    })
                
                //iOS 17+
                    .onChange(of: gridColumn, initial: false) {
                        //                        withAnimation(.easeOut(duration: 0.5)){
                        gridFixer = gridColumn
                        gridSwitch()
                        //                        }
                    }
            
                //MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white.opacity(0.5), lineWidth: 1))
                            .onTapGesture {
                                withAnimation(.spring(duration: 0.6)){
                                    selectedAnimal = animal.image
                                }
                                haptic.impactOccurred()
                            }
                    }//: Loop
                }//: Grid
                //Deprecated in iOS 15
                .animation(.easeOut, value: gridFixer)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

//MARK: - PREVIEW
#Preview {
    GalleryView()
}
