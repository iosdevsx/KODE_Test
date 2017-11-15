//
//  KDDatePickerKDDatePickerAssemblyContainer.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class DatePickerAssemblyContainer: Assembly {
	
	func assemble(container: Container) {
		container.register(DatePickerInteractor.self) { (r, presenter: DatePickerPresenter) in
			let interactor = DatePickerInteractor()
			interactor.output = presenter
			
			return interactor
		}
		
		container.register(DatePickerRouter.self) { (r, viewController: DatePickerViewController) in
			let router = DatePickerRouter()
			router.transitionHandler = viewController
			
			return router
		}
		
		container.register(DatePickerPresenter.self) { (r, viewController: DatePickerViewController) in
			let presenter = DatePickerPresenter()
			presenter.view = viewController
			presenter.interactor = r.resolve(DatePickerInteractor.self, argument: presenter)
			presenter.router = r.resolve(DatePickerRouter.self, argument: viewController)
			
			return presenter
		}
        
        container.storyboardInitCompleted(DatePickerViewController.self) { (r, controller) in
            controller.output = r.resolve(DatePickerPresenter.self, argument: controller)
        }
	}
	
}
