//
//  KDWeatherListKDWeatherListInteractor.swift
//  UTair
//
//  Created by Yury Loginov on 16/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

class WeatherListInteractor: WeatherListInteractorInput {

    weak var output: WeatherListInteractorOutput!
    var weatherService: WeatherService?
    
    func fetchWeather(city: String) {
        weatherService?.weatherHandler(city: city).success({ [weak self] result in
            if let responseObject = result.response as? WeatherResponseObject {
                self?.output.fetchWeatherSuccess(cities: responseObject.weatherArray!)
            }
        }).failure {
            self.output.fetchWeatherFailed()
        }
    }
}
