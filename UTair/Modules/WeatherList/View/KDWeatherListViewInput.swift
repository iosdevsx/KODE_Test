//
//  WeatherListKDWeatherListViewInput.swift
//  UTair
//
//  Created by Yury Loginov on 16/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

protocol WeatherListViewInput: class {

    /**
        @author Yury Loginov
        Setup initial state of the view
    */

    func setupInitialState(toCity: String, fromCity: String)
    func show(message: String)
    func setupTable(items: [WeatherModel])
}
