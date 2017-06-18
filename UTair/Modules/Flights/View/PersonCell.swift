//
//  PersonCell.swift
//  UTair
//
//  Created by Юрий Логинов on 16.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import UIKit
import SnapKit

class PersonCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var firstPersonView: UIView!
    @IBOutlet weak var secondPersonView: UIView!
    @IBOutlet weak var thirdPersonView: UIView!

    public func setup() {
        let firstPersonComponent = PersonComponent.createComponent(person: .adult)
        let secondPersonComponent = PersonComponent.createComponent(person: .kid)
        let thirdPersonComponent = PersonComponent.createComponent(person: .baby)
        
        firstPersonView.addSubview(firstPersonComponent)
        secondPersonView.addSubview(secondPersonComponent)
        thirdPersonView.addSubview(thirdPersonComponent)
        
        firstPersonComponent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        secondPersonComponent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        thirdPersonComponent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
