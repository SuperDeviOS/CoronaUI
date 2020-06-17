//
//  HomeViewModel.swift
//  CoronaUI
//
//  Created by Marcos Felipe Souza on 12/06/20.
//  Copyright © 2020 SuperDeviOS. All rights reserved.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject, Identifiable {
    
    private var summaryNetwork: SummaryNetworkManagerType
    private var disabled = Set<AnyCancellable>()
    @Published var country: Country?
    @Published var notFail: Bool = true
    @Published var searchingCountry: String = ""
    
    
    init(summaryNetwork: SummaryNetworkManagerType = SummaryNetworkManager()){
        self.summaryNetwork = summaryNetwork
        
        $searchingCountry
            .dropFirst()
            .sink(receiveCompletion: { _ in
                    print("Error ao digitar ou acabou a conexao")
                 }) { outPut in
                    print(outPut)
            }
            .store(in: &disabled)
    }
    
    public func fetch() {
        self.summaryNetwork
            .fetchSummary()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    self.notFail = false
                    self.country = nil
                case .finished: break
                }
            }, receiveValue: summary(_:))
            .store(in: &disabled)
    }
    
    private func summary(_ summary: SummaryResponseCovid19) {
        self.country = summary.countries?.first(where: { $0.countryCode == "BR" })
    }
    
}
