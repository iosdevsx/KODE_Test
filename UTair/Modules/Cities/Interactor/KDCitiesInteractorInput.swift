//
//  KDCitiesKDCitiesInteractorInput.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import Foundation

protocol CitiesInteractorInput {
    func getCities()
    func filterCities(filter: String)
}
