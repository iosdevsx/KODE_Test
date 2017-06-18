//
//  CityModel.swift
//  UTair
//
//  Created by Юрий Логинов on 15.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import ObjectMapper

class CityModel : Mappable {
    
    var city: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        city <- map["city"]
    }
}
