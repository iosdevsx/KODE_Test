//
//  FlightsKDFlightsRouter.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import Foundation
import ViperMcFlurry


class FlightsRouter: NSObject, FlightsRouterInput {
    fileprivate let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    fileprivate let citiesId = "CitiesViewController"
    fileprivate let datePickerid = "DatePickerViewController"
    fileprivate let weatherId = "WeatherListViewController"
    
    var transitionHandler: RamblerViperModuleTransitionHandlerProtocol!
    
    var transitionModuleFactory: RamblerViperModuleFactory {
        let factory = RamblerViperModuleFactory(storyboard: storyboard, andRestorationId: citiesId)
        return factory!
    }
    
    var transitionDatePicker: RamblerViperModuleFactory {
        let factory = RamblerViperModuleFactory(storyboard: storyboard, andRestorationId: datePickerid)
        return factory!
    }
    
    var transitionWeatherModule: RamblerViperModuleFactory {
        let factory = RamblerViperModuleFactory(storyboard: storyboard, andRestorationId: weatherId)
        return factory!
    }
    
    var datePickerModuleInput: DatePickerModuleInput?

    func showCitiesModule(delegate: CitiesModuleDelegate) {
        transitionHandler.openModule!(usingFactory: transitionModuleFactory) { sourceModuleTransitionHandler, destinationModuleTransitionHandler in
            
            let source = sourceModuleTransitionHandler as! UIViewController
            let destination = destinationModuleTransitionHandler as! UIViewController
            
            let navController = KDNavigationController.init(rootViewController: destination)
            source.present(navController, animated: true, completion: nil)

        }.thenChain { moduleInput in
            guard let input = moduleInput as? CitiesModuleInput else {
                fatalError()
            }
            input.delegate = delegate
            return nil
        }
    }
    
    func showDatePicker(delegate: DatePickerModuleDelegate) {
        transitionHandler.openModule!(usingFactory: transitionDatePicker) { sourceModuleTransitionHandler, destinationModuleTransitionHandler in
            let source = sourceModuleTransitionHandler as! UIViewController
            let destination = destinationModuleTransitionHandler as! UIViewController
            
            destination.modalPresentationStyle = .overCurrentContext
            source.present(destination, animated: true, completion: nil)
        }.thenChain { moduleInput -> RamblerViperModuleOutput? in
            guard let input = moduleInput as? DatePickerModuleInput else {
                fatalError()
            }
            self.datePickerModuleInput = input
            input.delegate = delegate
            return nil
        }
    }
    
    func showWeatherModule(toCity: String, fromCity: String) {
        transitionHandler.openModule!(usingFactory: transitionWeatherModule) { sourceModuleTransitionHandler, destinationModuleTransitionHandler in
                let source = sourceModuleTransitionHandler as! UIViewController
                let destination = destinationModuleTransitionHandler as! UIViewController
                
                destination.modalPresentationStyle = .overCurrentContext
                source.navigationController?.pushViewController(destination, animated: true)
                
            }.thenChain { moduleInput in
                guard let input = moduleInput as? WeatherListModuleInput else {
                    fatalError()
                }
                input.configure(toCity: toCity, fromCity: fromCity)
                return nil
        }
    }
    
    
    func closeDatePicker() {
        self.datePickerModuleInput?.close()
    }
}
