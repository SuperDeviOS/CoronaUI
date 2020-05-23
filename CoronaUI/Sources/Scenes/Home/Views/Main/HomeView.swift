//
//  HomeView.swift
//  CoronaUI
//
//  Created by Marcos Felipe Souza on 23/05/20.
//  Copyright © 2020 Carlos Henrique Martins. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationView {
            List {
                TodayStaticsCard(date: "13/04/20",
                newCases: 293,
                deaths: 27)
                .listRowInsets(EdgeInsets())
            }
        .navigationBarTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
