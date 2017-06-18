//
//  RootKDRootRouterInput.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import Foundation

protocol RootRouterInput {
    func getTicketsController() -> TicketsViewController!
    func getRegistrationController() -> RegistrationViewController!
    func getFlightsController() -> FlightsViewController!
    
    func openSupportModule()
}
