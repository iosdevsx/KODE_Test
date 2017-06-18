//
//  KDNavigationController.swift
//  UTair
//
//  Created by Юрий Логинов on 10.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

class KDNavigationController : UINavigationController {    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController!.preferredStatusBarStyle
    }
}
