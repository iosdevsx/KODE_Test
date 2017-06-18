//
//  SupportKDSupportPresenter.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

class SupportPresenter: SupportModuleInput, SupportViewOutput, SupportInteractorOutput {

    weak var view: SupportViewInput!
    var interactor: SupportInteractorInput!
    var router: SupportRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
}
