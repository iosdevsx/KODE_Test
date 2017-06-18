//
//  RegistrationKDRegistrationPresenter.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

class RegistrationPresenter: RegistrationModuleInput, RegistrationViewOutput, RegistrationInteractorOutput {

    weak var view: RegistrationViewInput!
    var interactor: RegistrationInteractorInput!
    var router: RegistrationRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
    
    func handleFind(name: String, secondName: String, document: String) {
        if name.isEmpty {
            view.showError(error: "Укажите имя")
            return
        }
        
        if secondName.isEmpty {
            view.showError(error: "Укажите фамилию")
            return
        }
        
        if document.isEmpty {
            view.showError(error: "Укажите номер документа")
            return
        }
        
        interactor.beginOperation()
    }
    
    func operationFindEnded() {
        view.showError(error: "Рейс не найден")
    }
}
