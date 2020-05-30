//
//  SearchBar.swift
//  CoronaUI
//
//  Created by Marcos Felipe Souza on 30/05/20.
//  Copyright © 2020 Carlos Henrique Martins. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    @Environment(\.editMode) var editMode
    var text: String?
    @Binding var textSearched: String
    var actionButton: (()->())?
    
    
    var body: some View {
        HStack {
            TextField(text ?? "search", text: $textSearched)
                .foregroundColor(.primary)

            if textSearched.count > 0 {
                Button(action: {
                    self.textSearched = ""
                }) {
                    Image(systemName: "clear")
                        .renderingMode(.template)
                        .modifier(ItemSearchModifier())
                }
                
                
            } else {
                Button(action: actionButton ?? {}) {
                    Image(systemName: "magnifyingglass")
                        .renderingMode(.template)
                        .modifier(ItemSearchModifier())
                }
            }
        }
    }
}


/// Common Modifier for Search 
struct ItemSearchModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .padding()
        .foregroundColor(.gray)
        .opacity(0.5)
    }
    
    
}

#if DEBUG
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(textSearched: .constant(""), actionButton: {
            print("FOII")
        })
    }
}
#endif
