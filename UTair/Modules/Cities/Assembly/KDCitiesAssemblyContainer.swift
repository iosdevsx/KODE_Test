//
//  KDCitiesKDCitiesAssemblyContainer.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class CitiesAssemblyContainer: AssemblyType {
	
	func assemble(container: Container) {
		container.register(CitiesInteractor.self) { (r, presenter: CitiesPresenter) in
			let interactor = CitiesInteractor()
			interactor.output = presenter
            interactor.citiesService = CitiesService()
            interactor.operationQueue = OperationQueue()
			
			return interactor
		}
		
		container.register(CitiesRouter.self) { (r, viewController: CitiesViewController) in
			let router = CitiesRouter()
            router.transitionHandler = viewController
            return router
		}
		
		container.register(CitiesPresenter.self) { (r, viewController: CitiesViewController) in
			let presenter = CitiesPresenter()
			presenter.view = viewController
			presenter.interactor = r.resolve(CitiesInteractor.self, argument: presenter)
			presenter.router = r.resolve(CitiesRouter.self, argument: viewController)
			
			return presenter
		}
		
		container.registerForStoryboard(CitiesViewController.self) { r, viewController in
			viewController.output = r.resolve(CitiesPresenter.self, argument: viewController)
		}
	}
	
}
