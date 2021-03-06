//
//  DatePickerMocksHelper.swift
//  UTairTests
//
//  Created by Юрий Логинов on 10.12.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
@testable import UTair
@testable import ViperMcFlurry

class DatePickerViewControllerMock : DatePickerViewInput {
    
    var setupInitialStateCalled = false
    var showCalled = false
    
    
    func setupInitialState() {
        setupInitialStateCalled = true
    }
    
    func show(message: String) {
        showCalled = true
    }
}

class DatePickerRouterMock : DatePickerRouterInput {
    var closeCalled = false
    
    func close() {
        closeCalled = true
    }
}

class DatePickerModuleDelegateMock : DatePickerModuleDelegate {
    
    var dateSelectedCalled = false
    var selectedDate : Date?
    
    func dateSelected(date: Date) {
        selectedDate = date
        dateSelectedCalled = true
    }
}

class DatePickerViewOutputMock : DatePickerViewOutput {
    
    var viewIsReadyCalled = false
    var handleCancelTapCalled = false
    var handleDateSelectedCalled = false
    
    var selectedDate: Date?
    
    func viewIsReady() {
        viewIsReadyCalled = true
    }
    
    func handleCancelTap() {
        handleCancelTapCalled = true
    }
    
    func handleDateSelected(date: Date) {
        handleDateSelectedCalled = true
        selectedDate = date
    }
}
