//
//  CitiesKDCitiesPresenter.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import Foundation

class CitiesPresenter: NSObject, CitiesModuleInput, CitiesViewOutput, CitiesInteractorOutput {

    weak var view: CitiesViewInput!
    var interactor: CitiesInteractorInput!
    var router: CitiesRouterInput!
    var delegate: CitiesModuleDelegate?

    func viewIsReady() {
        interactor.getCities()
        view.setupInitialState()
    }
    
    func handleSelectedCity(city: String) {
        delegate?.selected(city: city)
        router.closeModule()
    }
    
    func handleSearchTextDidChange(searchText: String) {
        interactor.filterCities(filter: searchText)
    }
    
    func fetchCitiesSuccess(cities: [CityModel]) {
        view.configureDataSource(cities: cities)
    }
    
    func fetchCitiesFailed() {
        view.show(message: "Ошибка загрузки")
    }
}
