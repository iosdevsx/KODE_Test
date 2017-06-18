//
//  DatePickerKDDatePickerViewOutput.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//
import Foundation

@objc protocol DatePickerViewOutput {

    /**
        @author Yury Loginov
        Notify presenter that view is ready
    */

    func viewIsReady()
    func handleCancelTap()
    func handleDateSelected(date: Date)
}
