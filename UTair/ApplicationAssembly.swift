//
//  ApplicationAssembly.swift
//  UTair
//
//  Created by Юрий Логинов on 09.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

class ApplicationAssembly {
    class var assembler: Assembler {
        return Assembler([
            RootAssemblyContainer(),
            TicketsAssemblyContainer(),
            FlightsAssemblyContainer(),
            SupportAssemblyContainer(),
            RegistrationAssemblyContainer(),
            CitiesAssemblyContainer(),
            DatePickerAssemblyContainer(),
            WeatherListAssemblyContainer()])
    }
    
    var assembler: Assembler
    
    init(_ assemblies: [Assembly], container: Container = Container()) {
        assembler = Assembler(container: container)
    }
    
}

//Inject dependency in Main Storyboard
extension SwinjectStoryboard {
    
    public static func setup() {
        defaultContainer = ApplicationAssembly.assembler.resolver as! Container
    }
    
}
