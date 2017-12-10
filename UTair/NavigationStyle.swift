//
//  NavigationStyle.swift
//  UTair
//
//  Created by Юрий Логинов on 09.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func setBlueStyle() {
        navigationBar.barTintColor = UIColor.mainBlueColor
        navigationBar.tintColor = UIColor.white
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage.init(), for: .default)
        navigationBar.shadowImage = UIImage.init()
        navigationBar.titleTextAttributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor:UIColor.white]
    }
    
    func setWhiteStyle() {
        navigationBar.barTintColor = UIColor.white
        navigationBar.tintColor = UIColor.black
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage.init(), for: .default)
        navigationBar.shadowImage = UIImage.init()
        navigationBar.titleTextAttributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor:UIColor.black]
    }
}
