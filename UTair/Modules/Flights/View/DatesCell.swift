//
//  DatesCell.swift
//  UTair
//
//  Created by Юрий Логинов on 12.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

protocol DatesCellDelegate {
    func date(cell:DatesCell, destination: DateViewDestination)
}

class DatesCell : UITableViewCell {
    @IBOutlet weak var toDateView: UIView!
    @IBOutlet weak var fromDateView: UIView!
    
    var toDateComponent: DateViewComponent?
    var fromDateComponent: DateViewComponent?
    
    var delegate: DatesCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setup() {
        
        toDateComponent = DateViewComponent.create(destination: .to, state: .selected)
        toDateComponent?.delegate = self
        fromDateComponent = DateViewComponent.create(destination: .from, state: .notSelected)
        fromDateComponent?.delegate = self
        
        toDateView.addSubview(toDateComponent!)
        fromDateView.addSubview(fromDateComponent!)
        
        toDateComponent?.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        fromDateComponent?.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func updateState(date: Date?, destination: DateViewDestination) {
        switch destination {
            case .from:
                fromDateComponent?.updateDate(date: date)
                break
            case .to:
                toDateComponent?.updateDate(date: date)
                break
        }
    }
}

extension DatesCell: DateViewComponentDelegate {
    func handleAction(component: DateViewComponent) {
        delegate?.date(cell: self, destination: component.destinationState!)
    }
}
