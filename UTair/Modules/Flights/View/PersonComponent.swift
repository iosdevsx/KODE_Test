//
//  PersonComponent.swift
//  UTair
//
//  Created by Юрий Логинов on 16.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

enum PersonType {
    case baby, kid, adult
}

class PersonComponent : UIView {
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var numberOfPersion: UILabel!
    @IBOutlet weak var personDescription: UILabel!
    
    var personCount: Int = 1
    
    class func createComponent(person: PersonType) -> PersonComponent {
        let component = Bundle.main.loadNibNamed(String(describing: PersonComponent.self), owner: nil, options: nil)?.first as! PersonComponent
        switch person {
            case .kid:
                component.personImage.image = UIImage.init(named: "kid")
                component.personDescription.text = "2-12 лет"
                break
            case .baby:
                component.personImage.image = UIImage.init(named: "baby")
                component.personDescription.text = "до 2-х лет"
                break
            case .adult:
                component.personImage.image = UIImage.init(named: "kid")
                component.personDescription.text = "Взрослый"
                break
        }
        component.numberOfPersion.text = "\(1)"
        return component
    }
    
    @IBAction func actionPlus(_ sender: Any) {
        personCount += 1
        numberOfPersion.text = "\(personCount)"
    }
    
    @IBAction func actionMinus(_ sender: Any) {
        if personCount > 0 {
            personCount -= 1
        }
        numberOfPersion.text = "\(personCount)"
    }
}
