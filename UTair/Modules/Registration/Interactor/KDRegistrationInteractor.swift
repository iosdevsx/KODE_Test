//
//  KDRegistrationKDRegistrationInteractor.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

class RegistrationInteractor: RegistrationInteractorInput {

    weak var output: RegistrationInteractorOutput!
    
    func beginOperation() {
        output.operationFindEnded()
    }
}
