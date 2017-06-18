//
//  KDButtonStyle.swift
//  UTair
//
//  Created by Юрий Логинов on 12.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

extension KDButton {
    func applyFindStyle() {
        backgroundColor = UIColor.darkBlue
        tintColor = UIColor.white
        clipsToBounds = true
        isEnabled = true
        layer.cornerRadius = frame.height / 2
    }
    
    func applyDateStyle() {
        backgroundColor = UIColor.clear
        tintColor = UIColor.white
        clipsToBounds = true
        isEnabled = true
        layer.cornerRadius = 5
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }
}
