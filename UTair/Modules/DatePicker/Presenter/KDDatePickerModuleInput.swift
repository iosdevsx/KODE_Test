//
//  DatePickerKDDatePickerModuleInput.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import Foundation

protocol DatePickerModuleDelegate {
    func dateSelected(date: Date)
}

protocol DatePickerModuleInput: class {
    var delegate: DatePickerModuleDelegate? {get set}
    var destination: DateViewDestination? {get set}
    func close()
}
