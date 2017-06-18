//
//  RootKDRootPresenter.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit

class RootPresenter: RootModuleInput, RootViewOutput, RootInteractorOutput {

    weak var view: RootViewInput!
    var interactor: RootInteractorInput!
    var router: RootRouterInput!

    func viewIsReady() {
        let ticketsController: TicketsViewController! = router.getTicketsController()
        let registrationController: RegistrationViewController! = router.getRegistrationController()
        let flightsController: FlightsViewController! = router.getFlightsController()
        
        view.setupInitialState(controllers: [ticketsController, registrationController, flightsController])
    }
    
    func handleQuestion() {
        router.openSupportModule()
    }
}
