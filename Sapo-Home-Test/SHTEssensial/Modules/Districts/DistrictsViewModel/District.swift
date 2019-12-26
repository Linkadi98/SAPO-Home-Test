//
//  District.swift
//  Sapo-Home-Test
//
//  Created by Minh Pham on 12/25/19.
//  Copyright © 2019 Sapo. All rights reserved.
//

import Foundation

struct Districts: Decodable {
    var districts: [District]?
    
    private enum CodingKeys: String, CodingKey {
        case districts = "Districts"
    }
}
class District: Decodable {
    var cityCode: Int?
    var name: String?
    var districtCode: Int?
    
    private enum CodingKeys: String, CodingKey {
        case cityCode = "CityCode"
        case name = "Name"
        case districtCode = "DistrictCode"
    }
}
