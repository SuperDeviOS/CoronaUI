//
//  PercentageCasesView.swift
//  CoronaUI
//
//  Created by Carlos Henrique Martins on 5/30/20.
//  Copyright © 2020 SuperDeviOS. All rights reserved.
//

import SwiftUI

enum TypeOfCases: String {
    case recovery, fatality
}

struct PercentageCasesView: View {
    
    var typeOfCase: TypeOfCases
    var percentageCase: String
    
    private func getSeparatorForegroundColor(basedOn typeOfCase: TypeOfCases) -> UIColor {
        switch typeOfCase {
        case .recovery:
            return UIColor.blue
        case .fatality:
            return UIColor.red
        }
    }
    
    private func getTitle(basedOn typeOfCase: TypeOfCases) -> String {
        switch typeOfCase {
        case .recovery:
            return "Recovery"
        case .fatality:
            return "Fatality"
        }
    }
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 0.5)
                .foregroundColor(.blue)
            
                VStack(spacing: 5) {
                    Text(self.getTitle(basedOn: typeOfCase))
                        .font(.body)
                        .bold()
                    Color(self.getSeparatorForegroundColor(basedOn: typeOfCase))
                        .frame(width: 15,
                               height: 5)
                    Text("\(percentageCase)")
                        .foregroundColor(.gray)
                        .padding(.top, 10.0)
                }
        }
        .padding()
    }
}

struct PercentageCasesView_Previews: PreviewProvider {
    static var previews: some View {
        PercentageCasesView(typeOfCase: .recovery, percentageCase: "50%")
    }
}
