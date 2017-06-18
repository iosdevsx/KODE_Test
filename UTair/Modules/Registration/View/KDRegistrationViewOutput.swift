//
//  RegistrationKDRegistrationViewOutput.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

protocol RegistrationViewOutput {

    /**
        @author Yury Loginov
        Notify presenter that view is ready
    */

    func viewIsReady()
    func handleFind(name: String, secondName: String, document: String)
}
