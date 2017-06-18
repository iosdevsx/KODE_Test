//
//  DateViewComponent.swift
//  UTair
//
//  Created by Юрий Логинов on 12.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

enum DateViewDestination {
    case to, from
}

enum DateViewComponentState {
    case selected, notSelected
}

protocol DateViewComponentDelegate {
    func handleAction(component: DateViewComponent)
}

class DateViewComponent : UIView {

    //MARK: Outlets
    
    @IBOutlet weak var fromDateButton: KDButton!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    //MARK: Properties
    
    var delegate: DateViewComponentDelegate?
    var destinationState: DateViewDestination?
    var componentState: DateViewComponentState?
    var currentDateState: Date?
    
    var dateFormatter : DateFormatter {
        get {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            return formatter
        }
    }
    
    //MARK: Initial
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    class func create(destination: DateViewDestination, state: DateViewComponentState) -> DateViewComponent {
        let component = Bundle.main.loadNibNamed(String(describing: DateViewComponent.self), owner: nil, options: nil)?.first as! DateViewComponent
        component.fromDateButton.applyDateStyle()
        let tapGesture = UITapGestureRecognizer.init(target: component, action: #selector(DateViewComponent.actionTapGesture))
        
        component.dateView.addGestureRecognizer(tapGesture)
        component.destinationState = destination
        
        switch destination {
            case .to:
                component.destinationLabel.text = "Туда"
                component.cancelButton.isHidden = true
                break
            case .from:
                component.destinationLabel.text = "Обратно"
                break
        }
        
        component.componentState = state
        
        switch state {
        case .selected:
            component.dateView.isHidden = false
            component.buttonView.isHidden = true
            component.setupDateViewState(date: Date())
            break
        case .notSelected:
            component.dateView.isHidden = true
            component.buttonView.isHidden = false
            break
        }
        
        return component
    }
    
    func swap() {
        
        if let state = componentState {
            switch state {
            case .selected:
                componentState = .notSelected
                break
            case .notSelected:
                componentState = .selected
            }
        }
        
        buttonView.isHidden = !buttonView.isHidden
        dateView.isHidden = !dateView.isHidden
    }
    
    //MARK: DateView
    
    func actionTapGesture() {
        delegate?.handleAction(component: self)
    }
    
    func updateDate(date: Date?) {
        if currentDateState != nil {
            if let newDate = date {
                currentDateState = newDate
                setupDateViewState(date: newDate)
            } else {
                currentDateState = nil
                swap()
            }
        } else {
            if let newDate = date {
                currentDateState = newDate
                setupDateViewState(date: newDate)
                if (dateView.isHidden) {
                    swap()
                }
            }
        }
    }
    
    func setupDateViewState(date: Date) {
        let dateString = dateFormatter.string(from: date)
        dateLabel.text = dateString
    }
    
    @IBAction func actionCancel(_ sender: Any) {
        updateDate(date: nil)
    }
    
    //MARK: ButtonView
    
    @IBAction func actionButtonTap(_ sender: Any) {
        delegate?.handleAction(component: self)
    }
    
}
