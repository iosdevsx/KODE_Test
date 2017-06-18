//
//  CitiesKDCitiesViewOutput.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//
import Foundation

@objc protocol CitiesViewOutput {

    /**
        @author Yury Loginov
        Notify presenter that view is ready
    */

    func viewIsReady()
    func handleSelectedCity(city: String)
    func handleSearchTextDidChange(searchText: String)
}
