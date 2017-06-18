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
    
    /*
     *
     * О_о первый раз пишу на swift...
     *
     */
    
    class var assembler: Assembler {
        return try! Assembler(assemblies: [
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
    
    //If you want use custom Assembler
    init(with assemblies: [AssemblyType]) {
        assembler = try! Assembler(assemblies: assemblies)
    }
    
}

//Inject dependency in Main Storyboard
extension SwinjectStoryboard {
    
    public static func setup() {
        defaultContainer = ApplicationAssembly.assembler.resolver as! Container
    }
    
}
