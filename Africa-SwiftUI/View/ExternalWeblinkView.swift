//
//  ExternalWeblinkView.swift
//  Africa-SwiftUI
//
//  Created by Nikolay  Yuchormanski on 27.04.24.
//

import SwiftUI

struct ExternalWeblinkView: View {
    
    //MARK: - PROPERTIES
    let animal: Animal
    
    
    //MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName:"arrow.up.right.square")
                    Link(destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!, label: {
                        Text(animal.name)
                    })
                }
                .foregroundStyle(Color.accentColor)
            }//: HStack
        }//: Box
    }
}

//MARK: - PREVIEW
//#Preview {
//    ExternalWeblinkView()
//}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
