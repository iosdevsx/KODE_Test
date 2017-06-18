//
//  KDCitiesKDCitiesInteractor.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import Foundation

class CitiesInteractor: CitiesInteractorInput {

    weak var output: CitiesInteractorOutput!
    
    var citiesService: CitiesService?
    var operationQueue: OperationQueue?
    
    var cities: [CityModel]?
    
    func getCities() {
        self.citiesService?.fetchCities().success({ [weak self] result in
            if let responseObject = result.response as? CityResponseObject {
                self?.cities = responseObject.citiesArray
                self?.output.fetchCitiesSuccess(cities: responseObject.citiesArray!)
            }
        }).failure({ failed in
            self.output.fetchCitiesFailed()
        })
    }
    
    func filterCities(filter: String) {
        
        operationQueue?.cancelAllOperations()
        
        operationQueue?.addOperation({
            var citiesArray = self.cities
            if !filter.isEmpty {
                citiesArray = citiesArray?.filter({ cityModel -> Bool in
                    return (cityModel.city?.startsWith(string: filter))!
                })
            }
            DispatchQueue.main.async {
                self.output.fetchCitiesSuccess(cities: citiesArray!)
            }
        })
    }
}
