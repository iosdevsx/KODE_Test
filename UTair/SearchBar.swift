//
//  SearchBar.swift
//  UTair
//
//  Created by Юрий Логинов on 15.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit


protocol SearchBarDelegate {
    func didEnterText(text: String)
}

class SearchBar: UIView {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var closeButton: UIButton!
    
    var delegate: SearchBarDelegate?
    
    static func searchView() -> SearchBar {
        let view = Bundle.main.loadNibNamed(String(describing: SearchBar.self), owner: nil, options: nil)?.first as! SearchBar
        return view
    }
    
    func setState(filled: Bool) {
        if filled {
            textField.textAlignment = .left
            closeButton.isHidden = false
            backgroundColor = UIColor.white
        } else {
            textField.textAlignment = .center
            closeButton.isHidden = true
            backgroundColor = UIColor.grayLight
        }
    }
    
    @IBAction func actionCloseTap(_ sender: Any) {
        textField.text = ""
        textField.resignFirstResponder()
        setState(filled: false)
    }
}

extension SearchBar : UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        setState(filled: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let result = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
        delegate?.didEnterText(text: result)
        return true
    }
}
