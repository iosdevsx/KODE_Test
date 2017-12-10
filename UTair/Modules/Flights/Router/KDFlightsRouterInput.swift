//
//  FlightsKDFlightsRouterInput.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import Foundation
import ViperMcFlurry

protocol FlightsRouterInput {
    func showCitiesModule(delegate: CitiesModuleDelegate)
    func showDatePicker(delegate: DatePickerModuleDelegate)
    func closeDatePicker()
    func showWeatherModule(toCity: String, fromCity: String)
}
