//
//  KDWeatherListKDWeatherListAssemblyContainer.swift
//  UTair
//
//  Created by Yury Loginov on 16/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class WeatherListAssemblyContainer: Assembly {
	
	func assemble(container: Container) {
		container.register(WeatherListInteractor.self) { (r, presenter: WeatherListPresenter) in
			let interactor = WeatherListInteractor()
			interactor.output = presenter
			interactor.weatherService = WeatherService()
            
			return interactor
		}
		
		container.register(WeatherListRouter.self) { (r, viewController: WeatherListViewController) in
			WeatherListRouter()
		}
		
		container.register(WeatherListPresenter.self) { (r, viewController: WeatherListViewController) in
			let presenter = WeatherListPresenter()
			presenter.view = viewController
			presenter.interactor = r.resolve(WeatherListInteractor.self, argument: presenter)
			presenter.router = r.resolve(WeatherListRouter.self, argument: viewController)
			
			return presenter
		}
        
        container.storyboardInitCompleted(WeatherListViewController.self) { (r, controller) in
            controller.output = r.resolve(WeatherListPresenter.self, argument: controller)
        }
	}
	
}
