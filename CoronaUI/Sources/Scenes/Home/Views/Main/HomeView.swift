//
//  HomeView.swift
//  CoronaUI
//
//  Created by Marcos Felipe Souza on 23/05/20.
//  Copyright © 2020 SuperDeviOS. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    @State private var editMode = false
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            List {
                
                if viewModel.notFail && viewModel.country == nil {
                    loadingView
                
                } else {                    
                    if viewModel.country == nil {
                        emptyView
                    } else {
                        containerView
                    }
                }
            }
            .onAppear(perform: {
                self.viewModel.fetch()
            })
            .listStyle(GroupedListStyle())
            .navigationBarTitle(viewModel.country?.country ?? "Home")
        }
    }
}


extension HomeView {
    var loadingView: some View {
        Text("Searching .... 🧐")
    }
    
    @ViewBuilder
    var emptyView: some View {
        Text("Dont have networking in this moment... Sorry")
        
        Button(action: {
            self.viewModel.fetch()
        }) {
            Text("Reloading..")
        }
    }
    
    
    @ViewBuilder
    var containerView: some View {
        Section(header: Text("")) {
            TotalCasesCard(totalCases: viewModel.country?.newConfirmed ?? 0,
                           activeCases: 2000,
                           recoveredCases: 1000,
                           fatalCases: 1000)
            .listRowInsets(EdgeInsets())
        }
        Section {
            HStack {
                PercentageCasesView(typeOfCase: .recovery,
                                    percentageCase: "1,0%")
                
                PercentageCasesView(typeOfCase: .fatality,
                                    percentageCase: "0,5%")
            }
        }
        Section {
            TodayStaticsCard(date: viewModel.country?.date ?? "",
                             newCases: viewModel.country?.newConfirmed ?? 0,
                             deaths: viewModel.country?.newDeaths ?? 0)
            .listRowInsets(EdgeInsets())
        }
    }
}



#if DEBUG
struct HomeView_Previews: PreviewProvider {
    
    static var listOfDevices = ["iPhone SE", "iPhone 11 Pro Max"]
    static var previews: some View {
        Group {
            
            ForEach(self.listOfDevices, id: \.self) { item in
                HomeView()
                .previewDevice(PreviewDevice(rawValue: item))
                .previewDisplayName(item)
            }
            
            HomeView()
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .previewDisplayName("Com TEXTO GRANDES")
            
            HomeView()
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Com DARK MODE")
        }
    }
}
#endif
