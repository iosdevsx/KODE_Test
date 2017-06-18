//
//  CitiesKDCitiesModuleInput.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import ViperMcFlurry

protocol CitiesModuleDelegate {
    func selected(city: String)
}

protocol CitiesModuleInput: class {
    var delegate: CitiesModuleDelegate? {get set}
}
