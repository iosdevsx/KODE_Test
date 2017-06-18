//
//  TicketsKDTicketsPresenter.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

class TicketsPresenter: TicketsModuleInput, TicketsViewOutput, TicketsInteractorOutput {

    weak var view: TicketsViewInput!
    var interactor: TicketsInteractorInput!
    var router: TicketsRouterInput!

    func viewIsReady() {
        view.setupInitialState()
    }
}
