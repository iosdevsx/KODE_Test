//
//  KDWeatherListKDWeatherListInteractorInput.swift
//  UTair
//
//  Created by Yury Loginov on 16/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import Foundation

protocol WeatherListInteractorInput {
    func fetchWeather(city: String)
}
