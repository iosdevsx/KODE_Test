//
//  TextCell.swift
//  UTair
//
//  Created by Юрий Логинов on 09.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

class TextCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static func create(title: String) -> TextCell {
        let cell = Bundle.main.loadNibNamed(String(describing: TextCell.self), owner: nil, options: nil)?.first as! TextCell
        cell.textLabel?.text = title
        return cell
    }
    
    public func configure(title: String) {
        titleLabel.text = title
    }
}

