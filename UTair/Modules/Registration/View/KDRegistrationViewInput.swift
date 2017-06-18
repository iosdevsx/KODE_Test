//
//  RegistrationKDRegistrationViewInput.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

protocol RegistrationViewInput: class {

    /**
        @author Yury Loginov
        Setup initial state of the view
    */

    func setupInitialState()
    func showError(error: String)
}
