//
//  CitiesKDCitiesViewInput.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

protocol CitiesViewInput: class {

    /**
        @author Yury Loginov
        Setup initial state of the view
    */

    func setupInitialState()
    func configureDataSource(cities: [CityModel])
    func show(message: String)
}
