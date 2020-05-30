//
//  Country.swift
//  CoronaUI
//
//  Created by Carlos Henrique Martins on 5/30/20.
//  Copyright © 2020 Carlos Henrique Martins. All rights reserved.
//

import Foundation

// MARK: - CountryElement
struct CountryElement: Codable {
    let country, slug, iso2: String?

    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case slug = "Slug"
        case iso2 = "ISO2"
    }
}

