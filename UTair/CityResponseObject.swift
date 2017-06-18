//
//  CityResponseObject.swift
//  UTair
//
//  Created by Юрий Логинов on 15.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import ObjectMapper

class CityResponseObject: Mappable {
    
    var citiesArray: [CityModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        citiesArray <- map["results"]
    }
}
