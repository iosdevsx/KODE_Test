//
//  DatePickerKDDatePickerPresenter.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import Foundation

class DatePickerPresenter: DatePickerModuleInput, DatePickerViewOutput, DatePickerInteractorOutput {

    weak var view: DatePickerViewInput!
    var interactor: DatePickerInteractorInput!
    var router: DatePickerRouterInput!
    var destination: DateViewDestination?
    
    var delegate: DatePickerModuleDelegate?

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func handleCancelTap() {
        router.close()
    }
    
    func handleDateSelected(date: Date) {        
        if let dest = destination {
            switch dest {
            case .from:
                break
            case .to:
                break
            }
        }
        delegate?.dateSelected(date: date)
    }
    
    func close() {
        router.close()
    }
}
