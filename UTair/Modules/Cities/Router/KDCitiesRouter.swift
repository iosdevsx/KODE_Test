//
//  CitiesKDCitiesRouter.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import ViperMcFlurry

class CitiesRouter: CitiesRouterInput {
    
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    func closeModule() {
        transitionHandler.closeCurrentModule!(true)
    }
}
