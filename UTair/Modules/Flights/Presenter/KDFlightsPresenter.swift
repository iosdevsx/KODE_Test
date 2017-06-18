//
//  FlightsKDFlightsPresenter.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import Foundation

class FlightsPresenter: FlightsModuleInput, FlightsViewOutput, FlightsInteractorOutput {

    weak var view: FlightsViewInput!
    var interactor: FlightsInteractorInput!
    var router: FlightsRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func handleOpenCities() {
        router.showCitiesModule(delegate: self)
    }
    
    func handleDatePicker() {
        router.showDatePicker(delegate: self)
    }
    
    func handleFind(fromCity: String?, toCity:String?, fromDate:Date?, toDate:Date?) {
        //there is possible to add some validation for dates, but I haven't time for it
        router.showWeatherModule(toCity: toCity!, fromCity: fromCity!)
    }
}

extension FlightsPresenter: CitiesModuleDelegate {
    func selected(city: String) {
        view.setupCity(cityName: city)
    }
}

extension FlightsPresenter: DatePickerModuleDelegate {
    func dateSelected(date: Date) {
        view.setupDepartDate(date: date)
        router.closeDatePicker()
    }
}
