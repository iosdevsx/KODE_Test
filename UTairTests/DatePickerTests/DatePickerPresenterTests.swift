//
//  UTairTests.swift
//  UTairTests
//
//  Created by Юрий Логинов on 10.12.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import XCTest
@testable import UTair

class UTairTests: XCTestCase {
    
    var presenter : DatePickerPresenter!
    var viewMock : DatePickerViewControllerMock!
    var routerMock : DatePickerRouterMock!
    var delegateMock : DatePickerModuleDelegateMock!
    
    override func setUp() {
        super.setUp()
        
        viewMock = DatePickerViewControllerMock.init()
        routerMock = DatePickerRouterMock.init()
        delegateMock = DatePickerModuleDelegateMock.init()
        
        presenter = DatePickerPresenter.init()
        presenter.view = viewMock
        presenter.router = routerMock
        presenter.delegate = delegateMock
    }
    
    override func tearDown() {
        presenter = nil
        viewMock = nil
        routerMock = nil
        
        super.tearDown()
    }
    
    func testSetupInitalStateCalling() {
        presenter.viewIsReady()
        assert(viewMock.setupInitialStateCalled)
    }
    
    func testCloseCalling() {
        presenter.close()
        assert(routerMock.closeCalled)
    }
    
    func testHandleCancel() {
        presenter.handleCancelTap()
        assert(routerMock.closeCalled)
    }
    
    func testDateSelectedCalling() {
        presenter.handleDateSelected(date: Date.init())
        assert(delegateMock.dateSelectedCalled)
    }
    
    func testCorrectDateForwarded() {
        let date = Date.init()
        presenter.handleDateSelected(date: date)
        assert(date == delegateMock.selectedDate)
    }
}
