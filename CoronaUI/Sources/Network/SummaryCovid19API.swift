//
//  SummaryNetworkManager.swift
//  CoronaUI
//
//  Created by Marcos Felipe Souza on 12/06/20.
//  Copyright © 2020 SuperDeviOS. All rights reserved.
//

import Foundation
import Combine

public protocol SummaryNetworkManagerType {
    func fetchSummary() -> AnyPublisher<SummaryResponseCovid19, BaseNetworkManagerError>
}

final class SummaryNetworkManager: BaseNetworkManager, SummaryNetworkManagerType {
    override init(session: URLSession = .shared) {
        super.init(session: session)
    }
    public func fetchSummary() -> AnyPublisher<SummaryResponseCovid19, BaseNetworkManagerError> {
        return fetchData(basedOn: Covid19NetworkQuery.summary.urlComponent)
    }
}
