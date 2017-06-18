//
//  WeatherListKDWeatherListPresenter.swift
//  UTair
//
//  Created by Yury Loginov on 16/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

class WeatherListPresenter: WeatherListModuleInput, WeatherListViewOutput, WeatherListInteractorOutput {

    weak var view: WeatherListViewInput!
    var interactor: WeatherListInteractorInput!
    var router: WeatherListRouterInput!
    
    var cityFrom: String?
    var cityTo: String?
    
    func configure(toCity: String, fromCity: String) {
        cityFrom = fromCity
        cityTo = toCity
    }

    func viewIsReady() {
        view.setupInitialState(toCity: cityTo!, fromCity: cityFrom!)
        interactor.fetchWeather(city: cityTo!)
    }
    
    //MARK: Interactor output
    func fetchWeatherSuccess(cities: [WeatherModel]) {
        view.setupTable(items: cities)
    }
    
    func fetchWeatherFailed() {
        view.show(message: "Something went wrong...")
    }
}
