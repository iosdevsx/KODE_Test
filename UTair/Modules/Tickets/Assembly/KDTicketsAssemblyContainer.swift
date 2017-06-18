//
//  KDTicketsKDTicketsAssemblyContainer.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class TicketsAssemblyContainer: AssemblyType {
	
	func assemble(container: Container) {
		container.register(TicketsInteractor.self) { (r, presenter: TicketsPresenter) in
			let interactor = TicketsInteractor()
			interactor.output = presenter
			
			return interactor
		}
		
		container.register(TicketsRouter.self) { (r, viewController: TicketsViewController) in
			let router = TicketsRouter()
//			router.transitionHandler = viewController
			
			return router
		}
		
		container.register(TicketsPresenter.self) { (r, viewController: TicketsViewController) in
			let presenter = TicketsPresenter()
			presenter.view = viewController
			presenter.interactor = r.resolve(TicketsInteractor.self, argument: presenter)
			presenter.router = r.resolve(TicketsRouter.self, argument: viewController)
			
			return presenter
		}
		
		container.registerForStoryboard(TicketsViewController.self) { r, viewController in
			viewController.output = r.resolve(TicketsPresenter.self, argument: viewController)
		}
	}
	
}
