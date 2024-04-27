//
//  VideoPlayerView.swift
//  Africa-SwiftUI
//
//  Created by Nikolay  Yuchormanski on 27.04.24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    //MARK: - PROPERTIES
    var videoSelected: String
    var videoTitle: String

    //MARK: - BODY
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
//                Text(videoTitle)
                
            }
            .overlay(
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(.top, 6)
                .padding(.horizontal, 8)
            , alignment: .topLeading
            )
        }//: VStack
        .accentColor(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//MARK: - PREVIEW
#Preview {
    NavigationView {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
}
