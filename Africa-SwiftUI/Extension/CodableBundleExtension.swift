//
//  CodableBundleExtension.swift
//  Africa-SwiftUI
//
//  Created by Nikolay  Yuchormanski on 27.04.24.
//

import Foundation


extension Bundle {
    func decode <T: Codable> (_ file: String) -> T { // T came from TYPE. Make this bundle universal. If add exact type, it will work only for tose types
        // 1. Locate the JSON file
        guard let url = self.url(forResource: file, withExtension: nil) 
        else {
            fatalError("Failed to lacate \(file) in bundle.")
        }
        
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) 
        else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data)
        else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 5. Return ready-to-use data
        return loaded
    }
}
