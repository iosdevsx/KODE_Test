//
//  Weather.swift
//  UTair
//
//  Created by Юрий Логинов on 16.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation

class WeatherService {
    func weatherHandler(city: String) -> ResultHandler {
        let params = [
            "q":city,
            "units":"metric",
            "appid":AppNetworkInfo.API_KEY
        ]
        let input = RequestHandler.Input(method: .get, url: "http://api.openweathermap.org/data/2.5/forecast?", params: params, responseClass: WeatherResponseObject.self, needAuthorization: false)
        return RequestHandler.request(input)
    }
}
