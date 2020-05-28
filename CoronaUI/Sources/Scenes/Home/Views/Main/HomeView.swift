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
                Section(header: Text("")) {
                    TotalCasesCard(totalCases: 5000,
                                   activeCases: 2000,
                                   recoveredCases: 2000,
                                   fatalCases: 1000)
                    .listRowInsets(EdgeInsets())
                }
                Section {
                    TodayStaticsCard(date: "13/04/20",
                    newCases: 293,
                    deaths: 27)
                    .listRowInsets(EdgeInsets())
                }
            }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
