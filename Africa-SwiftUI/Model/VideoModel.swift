//
//  VideoModel.swift
//  Africa-SwiftUI
//
//  Created by Nikolay  Yuchormanski on 27.04.24.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // COMPUTED VIDEO NAME
    
    var thumbnail: String {
        "video-\(id)"
    }
}
