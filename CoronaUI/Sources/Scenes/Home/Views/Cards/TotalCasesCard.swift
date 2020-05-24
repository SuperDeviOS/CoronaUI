//
//  TotalCasesCard.swift
//  CoronaUI
//
//  Created by Carlos Henrique Martins on 5/24/20.
//  Copyright © 2020 Carlos Henrique Martins. All rights reserved.
//

import SwiftUI

struct TotalCasesCard: View {
    
    var totalCases: Int
    var activeCases: Int
    var recoveredCases: Int
    var fatalCases: Int
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 0.5)
            RoundedRectangle(cornerRadius: 10)
                .fill()
                .foregroundColor(.clear)
            
            VStack(alignment: .center, spacing: 4) {
                Text("Total cases")
                Text("10000")
                    .bold()
                headerContentView
            }
        }
        .padding()
    }
}

extension TotalCasesCard {
    
    var headerContentView: some View {
        HStack(alignment: .center, spacing: 30) {
            VStack(alignment: .center, spacing: 5) {
                Text("Active")
                Text("\(activeCases)")
                .bold()
            }
            VStack(alignment: .center, spacing: 5) {
                Text("Recovered")
                Text("\(recoveredCases)")
                .bold()
            }
            VStack(alignment: .center, spacing: 5) {
                Text("Fatal")
                Text("\(fatalCases)")
                .bold()
            }
        }
    }
}

struct TotalCasesCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalCasesCard(totalCases: 5000,
                       activeCases: 2000,
                       recoveredCases: 2000,
                       fatalCases: 1000)
    }
}
