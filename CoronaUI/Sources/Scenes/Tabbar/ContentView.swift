//
//  ContentView.swift
//  CoronaUI
//
//  Created by Carlos Henrique Martins on 5/23/20.
//  Copyright © 2020 Carlos Henrique Martins. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "doc.plaintext")
                        Text("Home")
                    }
            }
            .tag(0)
            
                
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(1)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
