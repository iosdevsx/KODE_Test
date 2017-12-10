//
//  KDCitiesCell.swift
//  UTair
//
//  Created by Юрий Логинов on 12.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit


protocol CitiesCellDelegate {
    func cityTap(sender: UILabel, destination: DateViewDestination)
    func cities(from: String, to: String)
}

class CitiesCell : UITableViewCell {
    
    var delegate: CitiesCellDelegate?
    
    @IBOutlet weak var firstCityLabel: UILabel!
    @IBOutlet weak var secondCityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let firstTapGesture = UITapGestureRecognizer.init(target: self, action: #selector(CitiesCell.actionTapLabel(sender:)))
        let secondTapGesture = UITapGestureRecognizer.init(target: self, action: #selector(CitiesCell.actionTapLabel(sender:)))
        
        firstCityLabel.addGestureRecognizer(firstTapGesture)
        secondCityLabel.addGestureRecognizer(secondTapGesture)
    }
    
    @IBAction func actionButtonTap(_ sender: Any) {
        let temp = secondCityLabel.text
        secondCityLabel.text = firstCityLabel.text
        firstCityLabel.text = temp
        delegate?.cities(from: firstCityLabel.text!, to: secondCityLabel.text!)
    }
    
    @objc func actionTapLabel(sender: UITapGestureRecognizer) {
        var destination: DateViewDestination
        
        if (sender.view?.isEqual(firstCityLabel))! {
            destination = .from
        } else {
            destination = .to
        }
        delegate?.cityTap(sender: sender.view as! UILabel, destination: destination)
    }
}
