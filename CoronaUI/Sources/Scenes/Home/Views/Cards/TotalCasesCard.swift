//
//  TotalCasesCard.swift
//  CoronaUI
//
//  Created by Carlos Henrique Martins on 5/24/20.
//  Copyright ©️ 2020 Carlos Henrique Martins. All rights reserved.
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
                ZStack {
                    RoundedRectangle(cornerRadius: 155)
                    .stroke(lineWidth: 7)
                    .foregroundColor(.red)
                    
                    
                    VStack(alignment: .center, spacing: 4) {
                        Text("Total cases")
                            .bold()
                        Text("\(totalCases)")
                            .font(.body)
                            .foregroundColor(.gray)
                            .accessibility(label: Text("valueTotalCases"))
                    }
                    .padding([.bottom, .top], 100)
                    
                }
                .padding(50)
                
                Divider()
                detailsCasesView
                Divider()
            }
        }
        .padding()
    }
}

extension TotalCasesCard {
    
    var detailsCasesView: some View {
        HStack(alignment: .center, spacing: 50) {
            VStack(alignment: .center, spacing: 5) {
                Text("Active")
                    .bold()
                Text("\(activeCases)")
                    .font(.body)
                    .foregroundColor(.gray)
                    .accessibility(label: Text("valueActiveCases"))
            }
            VStack(alignment: .center, spacing: 5) {
                Text("Recovered")
                    .bold()
                Text("\(recoveredCases)")
                    .font(.body)
                    .foregroundColor(.gray)
                    .accessibility(label: Text("valueRecoveredCases"))
            }
            VStack(alignment: .center, spacing: 5) {
                Text("Fatal")
                    .bold()
                Text("\(fatalCases)")
                    .font(.body)
                    .foregroundColor(.gray)
                    .accessibility(label: Text("valueFatalCases"))
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
