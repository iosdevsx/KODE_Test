//
//  TicketsKDTicketsViewController.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit

class TicketsViewController: UIViewController, TicketsViewInput {
	
	var output: TicketsViewOutput!
	
	// MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		output.viewIsReady()
	}
	
	
	// MARK: TicketsViewInput
    func setupInitialState() {
        
    }
}
