//
//  Model.swift
//  CoronaUI
//
//  Created by Carlos Henrique Martins on 5/30/20.
//  Copyright © 2020 Carlos Henrique Martins. All rights reserved.
//

//   let summary = try? newJSONDecoder().decode(Summary.self, from: jsonData)

import Foundation

// MARK: - Summary

// MARK: - Covid19SummaryResponse
public struct SummaryResponseCovid19: Codable {
    let global: Global?
    let countries: [Country]?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
}

// MARK: - Country
public struct Country: Codable {
    let country, countryCode, slug: String?
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int?
    let newRecovered, totalRecovered: Int?
    let date: String?

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case countryCode = "CountryCode"
        case slug = "Slug"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
    }
}

// MARK: - Global
public struct Global: Codable {
    let newConfirmed, totalConfirmed, newDeaths, totalDeaths: Int?
    let newRecovered, totalRecovered: Int?

    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}
