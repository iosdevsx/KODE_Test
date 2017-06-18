//
//  FlightsKDFlightsViewOutput.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import Foundation

protocol FlightsViewOutput {

    /**
        @author Yury Loginov
        Notify presenter that view is ready
    */

    func viewIsReady()
    func handleOpenCities()
    func handleDatePicker()
    func handleFind(fromCity: String?, toCity:String?, fromDate:Date?, toDate:Date?)
}
