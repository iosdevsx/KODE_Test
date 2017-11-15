//
//  KDFlightsKDFlightsAssemblyContainer.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class FlightsAssemblyContainer: Assembly {
	
	func assemble(container: Container) {
		container.register(FlightsInteractor.self) { (r, presenter: FlightsPresenter) in
			let interactor = FlightsInteractor()
			interactor.output = presenter
			
			return interactor
		}
		
		container.register(FlightsRouter.self) { (r, viewController: FlightsViewController) in
			let router = FlightsRouter()
			router.transitionHandler = viewController
			
			return router
		}
		
		container.register(FlightsPresenter.self) { (r, viewController: FlightsViewController) in
			let presenter = FlightsPresenter()
			presenter.view = viewController
			presenter.interactor = r.resolve(FlightsInteractor.self, argument: presenter)
			presenter.router = r.resolve(FlightsRouter.self, argument: viewController)
			
			return presenter
		}
        
        container.storyboardInitCompleted(FlightsViewController.self) { (r, controller) in
            controller.output = r.resolve(FlightsPresenter.self, argument: controller)
        }
	}
	
}
