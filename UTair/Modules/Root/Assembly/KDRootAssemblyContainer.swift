//
//  KDRootKDRootAssemblyContainer.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class RootAssemblyContainer: Assembly {
	
	func assemble(container: Container) {
		container.register(RootInteractor.self) { (r, presenter: RootPresenter) in
			let interactor = RootInteractor()
			interactor.output = presenter
			
			return interactor
		}
		
		container.register(RootRouter.self) { (r, viewController: RootViewController) in
			let router = RootRouter()
			router.transitionHandler = viewController
			
			return router
		}
		
		container.register(RootPresenter.self) { (r, viewController: RootViewController) in
			let presenter = RootPresenter()
			presenter.view = viewController
			presenter.interactor = r.resolve(RootInteractor.self, argument: presenter)
			presenter.router = r.resolve(RootRouter.self, argument: viewController)
			
			return presenter
        }
        
        container.storyboardInitCompleted(RootViewController.self) { (r, controller) in
            controller.output = r.resolve(RootPresenter.self, argument: controller)
        }
	}
	
}
