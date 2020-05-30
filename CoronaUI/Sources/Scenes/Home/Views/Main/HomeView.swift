//
//  HomeView.swift
//  CoronaUI
//
//  Created by Marcos Felipe Souza on 23/05/20.
//  Copyright © 2020 Carlos Henrique Martins. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var editMode = false
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                
                if !editMode {
                    Button(action: {
                        self.editMode.toggle()
                    }) {
                        Text("BRAZIL")
                            .font(.headline)
                        Image(systemName: "pencil")
                    }
                    .foregroundColor(.primary)
                    .padding()
                
                } else {
                    SearchBar(text: "Searching...",
                              textSearched: $searchText) {
                                self.editMode.toggle()
                                
                    }
                    .padding()

                    #if DEBUG
                    Text(searchText.isEmpty ? "Test Area for SearchBar" : searchText)
                    #endif
                }
                
                
                
                List {
                    Section(header: Text("")) {
                        TotalCasesCard(totalCases: 5000,
                                       activeCases: 2000,
                                       recoveredCases: 2000,
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
