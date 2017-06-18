//
//  WeatherResponseObject.swift
//  UTair
//
//  Created by Юрий Логинов on 16.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherResponseObject : Mappable {
    
    var weatherArray: [WeatherModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        weatherArray <- map["list"]
    }
}
