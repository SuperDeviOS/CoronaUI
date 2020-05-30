//
//  NetworkManager.swift
//  CoronaUI
//
//  Created by Carlos Henrique Martins on 5/30/20.
//  Copyright © 2020 Carlos Henrique Martins. All rights reserved.
//

import Foundation

enum NetworkQuery: String {
    case summary, countries
}

class NetworkManager {
    func fetchData(basedOn query: String, completionHandler: @escaping () -> ()) {
        let semaphore = DispatchSemaphore (value: 0)
        
        guard let urlRequest = URL(string: "https://api.covid19api.com/\(query)") else {
            return
        }

        var request = URLRequest(url: urlRequest,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
          print(String(data: data, encoding: .utf8)!)
          semaphore.signal()
        }

        task.resume()
        semaphore.wait()
    }
}
