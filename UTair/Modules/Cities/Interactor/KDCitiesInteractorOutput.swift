//
//  KDCitiesKDCitiesInteractorOutput.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import Foundation

protocol CitiesInteractorOutput: class {
    func fetchCitiesSuccess(cities: [CityModel])
    func fetchCitiesFailed()
}
