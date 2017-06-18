//
//  NavigationBarExtension.swift
//  UTair
//
//  Created by Юрий Логинов on 09.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func addLeftBarButton(title: String, action: Selector, target: Any) {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .done, target: target, action: action)
    }
    
    func showMessage(title: String) {
        Popup.showPopup(title: title)
    }
    
    func addBackButton(target: Any, action: Selector) {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "arrowLeft"), style: .plain, target: target, action: action)
    }
}
