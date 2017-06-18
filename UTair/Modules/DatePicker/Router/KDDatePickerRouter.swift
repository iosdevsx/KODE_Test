//
//  DatePickerKDDatePickerRouter.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import ViperMcFlurry

class DatePickerRouter: DatePickerRouterInput {
    
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func close() {
        transitionHandler.closeCurrentModule!(true)
    }
}
