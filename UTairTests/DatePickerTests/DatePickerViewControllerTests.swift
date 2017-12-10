//
//  DatePickerViewControllerTests.swift
//  UTairTests
//
//  Created by Юрий Логинов on 10.12.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import XCTest
import UIKit
@testable import UTair

class DatePickerViewControllersTests: XCTestCase {
    
    var viewController: DatePickerViewController!
    var viewOutputMock: DatePickerViewOutputMock!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "DatePickerViewController") as! DatePickerViewController
        viewController.loadView()
        viewOutputMock = DatePickerViewOutputMock.init()
        viewController.output = viewOutputMock
    }
    
    override func tearDown() {
        viewController = nil
        viewOutputMock = nil
        
        super.tearDown()
    }
    
    func testComponents() {
        assert(viewController.datePicker != nil)
        assert(viewController.output != nil)
    }
    
    func testViewIsReadyCalling() {
        viewController.viewDidLoad()
        assert(viewOutputMock.viewIsReadyCalled)
    }
    
    func testHandleCancelTapCalling() {
        viewController.actionCancelTap()
        assert(viewOutputMock.handleCancelTapCalled)
    }
    
    func testDateSelectedCalling() {
        viewController.actionDoneTap()
        assert(viewOutputMock.handleDateSelectedCalled)
    }
    
    func testCorrectDateForwarded() {
        let date = Date.init()
        viewController.datePicker.date = date
        viewController.actionDoneTap()
        assert(viewOutputMock.selectedDate == date)
    }
}
