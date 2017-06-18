//
//  WeatherModel.swift
//  UTair
//
//  Created by Юрий Логинов on 16.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherModel : Mappable {
    var temperature: NSNumber?
    var hour: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        temperature <- map["main.temp"]
        hour <- map["dt_txt"]
    }
}
