//
//  CoverImageView.swift
//  Africa-SwiftUI
//
//  Created by Nikolay  Yuchormanski on 27.04.24.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        TabView{
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Image("cover-lion")
                    .resizable()
                .scaledToFit()
            }//: ForEach LOOP
            
        }//: TabView
        .tabViewStyle(PageTabViewStyle())
        
        
    }
}

//MARK: - PREVIEW
//#Preview {
//    CoverImageView()
//}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
