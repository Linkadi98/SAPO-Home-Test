//
//  Cities.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/25/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import Foundation

struct Cities: Decodable {
    var cities: [City]?
    
    private enum CodingKeys: String, CodingKey {
        case cities = "Cities"
    }
}

struct City: Decodable {
    let name: String?
    let cityCode: Int?
    
    private enum CodingKeys: String, CodingKey {
        case name = "Name"
        case cityCode = "CityCode"
    }
}
