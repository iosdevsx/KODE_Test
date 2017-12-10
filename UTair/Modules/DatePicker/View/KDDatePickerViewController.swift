//
//  DatePickerKDDatePickerViewController.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController, DatePickerViewInput {
	
    @IBOutlet weak var datePicker: UIDatePicker!
	var output: DatePickerViewOutput!
	
	// MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		output.viewIsReady()
	}
	
	// MARK: DatePickerViewInput
	func setupInitialState() {
        
	}
    
    func show(message: String) {
        showMessage(title: message)
    }
    
    @IBAction func actionCancelTap() {
        output.handleCancelTap()
    }
    
    @IBAction func actionDoneTap() {
        output.handleDateSelected(date: datePicker.date)
    }
}
