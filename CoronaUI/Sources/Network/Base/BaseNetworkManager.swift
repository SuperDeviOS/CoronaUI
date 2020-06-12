//
//  NetworkManager.swift
//  CoronaUI
//
//  Created by Carlos Henrique Martins on 5/30/20.
//  Copyright © 2020 SuperDeviOS. All rights reserved.
//

import Combine
import Foundation

/// Error Handle for Base Network Manager
typealias BNMError = BaseNetworkManagerError
public enum BaseNetworkManagerError: Error {
    case invalidJson
    case invalidUrl
    case network(description: String)
    case parsing(description: String)
}

open class BaseNetworkManager {
    
    private var urlSession: URLSession
    
    init(session: URLSession = .shared) {
        self.urlSession = session
    }
    
    func fetchData<Model>(basedOn urlComponent: URLComponents) -> AnyPublisher<Model, BaseNetworkManagerError> where Model: Decodable {
        
        guard let url = urlComponent.url else {
            return Fail(error: BaseNetworkManagerError.invalidUrl).eraseToAnyPublisher()
        }
        
        return urlSession.dataTaskPublisher(for: url)
            .mapError { error in
                BaseNetworkManagerError.network(description: error.localizedDescription)
            }
            .flatMap { outPut in
                Just(outPut.data)
                    .decode(type: Model.self, decoder: JSONDecoder())
                    .mapError { BaseNetworkManagerError.parsing(description: $0.localizedDescription) }
            }
            .eraseToAnyPublisher()
    }
}
