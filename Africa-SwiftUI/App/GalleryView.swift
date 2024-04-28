//
//  GalleryView.swift
//  Africa-SwiftUI
//
//  Created by Nikolay  Yuchormanski on 27.04.24.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            Text("Gallery")
        }//: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

#Preview {
    GalleryView()
}
