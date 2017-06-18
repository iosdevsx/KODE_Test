//
//  KDTextFieldContainer.swift
//  UTair
//
//  Created by Юрий Логинов on 11.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class KDTextFieldContainer: UIView  {
    
    var textField: KDTextField?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    fileprivate func setup() {
        let textField = KDTextField.init()
        textField.lineColor = UIColor.white
        textField.placeholderColor = UIColor.white
        textField.selectedLineColor = UIColor.white
        textField.selectedTitleColor = UIColor.lightGray
        textField.textColor = UIColor.white
        textField.delegate = self
        
        let separator = UIView.init()
        separator.backgroundColor = UIColor.white
        
        self.textField = textField
        
        addSubview(textField)
        
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        self.textField!.snp.makeConstraints({ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(55)
        })
    }
}

extension KDTextFieldContainer: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isFirstResponder {
            textField.resignFirstResponder()
        }
        return true
    }
}
