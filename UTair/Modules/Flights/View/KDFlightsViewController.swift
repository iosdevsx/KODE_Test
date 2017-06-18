//
//  FlightsKDFlightsViewController.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit

class FlightsViewController: UIViewController, FlightsViewInput {
	
	var output: FlightsViewOutput!
    var selectedCity: UILabel?
    var destinationCity: DateViewDestination?
    
    let numberOfElements = 3
    
    @IBOutlet weak var findButton: KDButton!
    @IBOutlet weak var tableView: UITableView!
    
    var toCity: String?
    var fromCity: String?
    var toDate: Date?
    var fromDate: Date?
    
    var datesCell: DatesCell?
    var dest: DateViewDestination?
    
	// MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		output.viewIsReady()
	}
	
	
	// MARK: FlightsViewInput
	func setupInitialState() {
        fromCity = "Kazan"
        toCity = "Kaliningrad"
        toDate = Date()
        setupTable()
        findButton.applyFindStyle()
	}
    
    func showError(error: String) {
        showMessage(title: error)
    }
    
    func setupDepartDate(date: Date) {
        if let cell = datesCell {
            if let destination = dest {
                cell.updateState(date: date, destination: destination)
                if destination == .to {
                    toDate = cell.toDateComponent?.currentDateState
                } else if destination == .from {
                    fromDate = cell.fromDateComponent?.currentDateState
                }
            }
        }
        datesCell = nil
        dest = nil
    }
    
    func setupCity(cityName: String) {
        guard let cityLabel = selectedCity else {
            return
        }
        
        if let destination = destinationCity {
            switch destination {
                case .from:
                    fromCity = cityName
                    break
                case .to:
                    toCity = cityName
                    break
            }
        }
        
        destinationCity = nil
        cityLabel.text = cityName
        selectedCity = nil
    }
    
    @IBAction func actionFindTap(_ sender: Any) {
        output.handleFind(fromCity: fromCity, toCity: toCity, fromDate: fromDate, toDate: toDate)
    }
    
    func setupTable() {
        tableView.register(UINib.init(nibName: String(describing: CitiesCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CitiesCell.self))
        tableView.register(UINib.init(nibName: String(describing: DatesCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DatesCell.self))
        tableView.register(UINib.init(nibName: String(describing: PersonCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PersonCell.self))
        
        let backgroundView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
        backgroundView.backgroundColor = UIColor.mainBlueColor
        tableView.backgroundView = backgroundView
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FlightsViewController: CitiesCellDelegate {
    
    func cityTap(sender: UILabel, destination: DateViewDestination) {
        selectedCity = sender
        destinationCity = destination
        output.handleOpenCities()
    }
    
    func cities(from: String, to: String) {
        toCity = to
        fromCity = from
    }
}

extension FlightsViewController: DatesCellDelegate {
    func date(cell:DatesCell, destination: DateViewDestination) {
        datesCell = cell
        dest = destination
        
        output.handleDatePicker()
    }
}


