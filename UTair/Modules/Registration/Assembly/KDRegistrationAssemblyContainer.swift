//
//  KDRegistrationKDRegistrationAssemblyContainer.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class RegistrationAssemblyContainer: Assembly {
	
	func assemble(container: Container) {
		container.register(RegistrationInteractor.self) { (r, presenter: RegistrationPresenter) in
			let interactor = RegistrationInteractor()
			interactor.output = presenter
			
			return interactor
		}
		
		container.register(RegistrationRouter.self) { (r, viewController: RegistrationViewController) in
			let router = RegistrationRouter()
//			router.transitionHandler = viewController
			
			return router
		}
		
		container.register(RegistrationPresenter.self) { (r, viewController: RegistrationViewController) in
			let presenter = RegistrationPresenter()
			presenter.view = viewController
			presenter.interactor = r.resolve(RegistrationInteractor.self, argument: presenter)
			presenter.router = r.resolve(RegistrationRouter.self, argument: viewController)
			
			return presenter
		}
		
        container.storyboardInitCompleted(RegistrationViewController.self) { (r, controller) in
            controller.output = r.resolve(RegistrationPresenter.self, argument: controller)
        }
	}
	
}
