//
//  CitiesService.swift
//  UTair
//
//  Created by Юрий Логинов on 15.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CitiesService {
    func fetchCities() -> ResultHandler {
        let params = [
            "country":"ru",
            "radius":"50"
        ]
        let input = RequestHandler.Input(method: .get, url: "https://api.meetup.com/2/cities", params: params, responseClass: CityResponseObject.self, needAuthorization: false)
        return RequestHandler.request(input)
    }
}
