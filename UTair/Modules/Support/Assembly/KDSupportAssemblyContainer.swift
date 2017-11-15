//
//  KDSupportKDSupportAssemblyContainer.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class SupportAssemblyContainer: Assembly {
	
	func assemble(container: Container) {
		container.register(SupportInteractor.self) { (r, presenter: SupportPresenter) in
			let interactor = SupportInteractor()
			interactor.output = presenter
			
			return interactor
		}
		
		container.register(SupportRouter.self) { (r, viewController: SupportViewController) in
			let router = SupportRouter()
			//router.transitionHandler = viewController
			
			return router
		}
		
		container.register(SupportPresenter.self) { (r, viewController: SupportViewController) in
			let presenter = SupportPresenter()
			presenter.view = viewController
			presenter.interactor = r.resolve(SupportInteractor.self, argument: presenter)
			presenter.router = r.resolve(SupportRouter.self, argument: viewController)
			
			return presenter
		}
        
        container.storyboardInitCompleted(SupportViewController.self) { (r, controller) in
            controller.output = r.resolve(SupportPresenter.self, argument: controller)
        }
	}
	
}
