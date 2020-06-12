//
//  TodayStaticsCard.swift
//  CoronaUI
//
//  Created by Marcos Felipe Souza on 23/05/20.
//  Copyright © 2020 SuperDeviOS. All rights reserved.
//

import SwiftUI

struct TodayStaticsCard: View {
    
    var date: String
    var newCases: Int
    var deaths: Int
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 0.5)
                .foregroundColor(.blue)

            VStack(alignment: .leading, spacing: 4) {
                headerView
                listView
            }
            .padding()
        }
        .padding()
    }
}

//MARK: - Components UI
extension TodayStaticsCard {
    
    var headerView: some View {
        HStack {
            Text("Today")
                .font(.title)
                .accessibility(label: Text("todayHeader"))
            Text(self.date)
                .font(.subheadline)
                .foregroundColor(.gray)
                .accessibility(label: Text("dateTodayHeader"))
        }
    }
    
    var listView: some View {
        VStack(spacing: 2) {
            HStack {
                Text("New Cases")
                .accessibility(label: Text("newCasesLine"))
                Spacer()
                Text("\(newCases)")
                    .font(.body)
                    .foregroundColor(.gray)
                    .accessibility(label: Text("valueNewCasesLine"))
            }
            Divider().padding(.bottomDivider)
            
            HStack {
                Text("Deaths")
                .accessibility(label: Text("deathsLine"))
                Spacer()
                Text("\(deaths)")
                    .font(.body)
                    .foregroundColor(.gray)
                    .accessibility(label: Text("valueDeathsLine"))
            }
            Divider().padding(.bottomDivider)
            
        }.padding(.top)
    }
    
}

struct TodayStaticsCard_Previews: PreviewProvider {
    static var previews: some View {
        TodayStaticsCard(date: "13/04/20",
                         newCases: 293,
                         deaths: 27)
    }
}
