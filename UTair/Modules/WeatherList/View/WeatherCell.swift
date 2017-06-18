//
//  WeatherCell.swift
//  UTair
//
//  Created by Юрий Логинов on 16.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell : UITableViewCell {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var formatter: NumberFormatter {
        get {
            let formatter = NumberFormatter.init()
            formatter.maximumFractionDigits = 2
            formatter.minimumFractionDigits = 2
            return formatter
        }
    }
    
    func configure(hour: String, temp: NSNumber) {
        temperatureLabel.text = formatter.string(from: temp)
        hourLabel.text = hour
    }
}
