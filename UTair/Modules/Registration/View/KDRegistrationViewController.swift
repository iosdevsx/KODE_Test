//
//  RegistrationKDRegistrationViewController.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, RegistrationViewInput {
	
	var output: RegistrationViewOutput!
	
    @IBOutlet weak var findButton: KDButton!
    @IBOutlet weak var nameFieldContainer: KDTextFieldContainer!
    @IBOutlet weak var documentFieldContainer: KDTextFieldContainer!
    @IBOutlet weak var secondNameFieldContainer: KDTextFieldContainer!
    
	// MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		output.viewIsReady()
	}
	
	
	// MARK: RegistrationViewInput
	func setupInitialState() {
        nameFieldContainer.textField?.placeholder = "Имя"
        secondNameFieldContainer.textField?.placeholder = "Фамилия"
        documentFieldContainer.textField?.placeholder = "Номер документа"
        findButton.applyFindStyle()
	}
    
    func showError(error: String) {
        showMessage(title: error)
    }
    
    @IBAction func actionFind(_ sender: Any) {
        output.handleFind(name: (nameFieldContainer.textField?.text)!, secondName: (secondNameFieldContainer.textField?.text)!, document: (documentFieldContainer.textField?.text)!)
    }
}
