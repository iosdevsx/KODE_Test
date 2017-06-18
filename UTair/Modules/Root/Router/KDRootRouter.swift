//
//  RootKDRootRouter.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//
import Foundation
import ViperMcFlurry

class RootRouter: RootRouterInput {
    fileprivate let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    fileprivate let ticketsId = "TicketsViewController"
    fileprivate let registrationId = "RegistrationViewController"
    fileprivate let flightsId = "FlightsViewController"
    fileprivate let supportId = "SupportViewController"
    
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    var transitionModuleFactory: RamblerViperModuleFactory {
        let factory = RamblerViperModuleFactory(storyboard: storyboard, andRestorationId: supportId)
        return factory!
    }
    
    func getTicketsController() -> TicketsViewController! {
        let vc = storyboard.instantiateViewController(withIdentifier: ticketsId)
        guard let tickets = vc as? TicketsViewController else {
            fatalError("there is no controller with that id")
        }
        return tickets
    }
    
    func getRegistrationController() -> RegistrationViewController! {
        let vc = storyboard.instantiateViewController(withIdentifier: registrationId)
        guard let registration = vc as? RegistrationViewController else {
            fatalError("there is no controller with that id")
        }
        return registration
    }
    
    func getFlightsController() -> FlightsViewController! {
        let vc = storyboard.instantiateViewController(withIdentifier: flightsId)
        guard let flights = vc as? FlightsViewController else {
            fatalError("there is no controller with that id")
        }
        return flights
    }
    
    func openSupportModule() {
        transitionHandler.openModule!(usingFactory: transitionModuleFactory) {
            sourceModuleTransitionHandler, destinationModuleTransitionHandler in
            let source = sourceModuleTransitionHandler as! UIViewController
            let destination = destinationModuleTransitionHandler as! UIViewController
            
            source.navigationController?.pushViewController(destination, animated: true)
            source.navigationController?.hidesBottomBarWhenPushed = true
            }.thenChain { moduleInput in
                return nil
        }
    }
}
