//
//  HeadingView.swift
//  Africa-SwiftUI
//
//  Created by Nikolay  Yuchormanski on 27.04.24.
//

import SwiftUI

struct HeadingView: View {
    
    //MARK: - PROPERTIES
    
    
    var headingImage: String
    var headingText: String
    
    //MARK: - BODY
    var body: some View {
        
        HStack {
            Image(systemName: headingImage)
                .foregroundStyle(Color.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
            
        }
        .padding(.vertical)
    }
}

//MARK: - PREVIEW
#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
}
