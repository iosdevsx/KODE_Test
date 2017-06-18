//
//  WeatherListKDWeatherListViewController.swift
//  UTair
//
//  Created by Yury Loginov on 16/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController, WeatherListViewInput {
	
	var output: WeatherListViewOutput!
    
	@IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var items: [WeatherModel]?
    
	// MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		output.viewIsReady()
	}
	
	// MARK: WeatherListViewInput
	func setupInitialState(toCity: String, fromCity: String) {
        
        //Of course it will be better to make flow layout for every day
        tableView?.register(UINib.init(nibName: String(describing: WeatherCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WeatherCell.self))
        tableView?.dataSource = self
        toLabel.text = toCity
        fromLabel.text = fromCity
	}
    
    func show(message: String) {
        showMessage(title: message)
    }
    
    func setupTable(items: [WeatherModel]) {
        self.items = items
        tableView.reloadData()
    }
}
