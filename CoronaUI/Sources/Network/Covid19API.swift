//
//  Covid19API.swift
//  CoronaUI
//
//  Created by Marcos Felipe Souza on 12/06/20.
//  Copyright © 2020 SuperDeviOS. All rights reserved.
//

import Foundation


///Contain info about API
struct Covid19API {
    static let scheme = "https"
    static let host = "api.covid19api.com"
}


///Contain all endpoint in Covid19 API
public enum Covid19NetworkQuery: String {
    case summary = "/summary"
}


public extension Covid19NetworkQuery {
    ///Get urlcomponent with type of Enum
    var urlComponent: URLComponents {
        var components = URLComponents()
        components.scheme = Covid19API.scheme
        components.host = Covid19API.host
        components.path = self.rawValue
        return components
    }
}
