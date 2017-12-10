//
//  CitiesKDCitiesViewController.swift
//  UTair
//
//  Created by Yury Loginov on 15/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController, CitiesViewInput {
	
	var output: CitiesViewOutput!
    var citiesData: [CityModel]?
    var tableView: UITableView?
    
    @IBOutlet weak var containerView: UIView!
    
	// MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		output.viewIsReady()
	}
	
	
	// MARK: CitiesViewInput
	func setupInitialState() {
        tableView = UITableView.init()
        containerView.addSubview(tableView!)
        
        tableView?.register(UINib.init(nibName: String(describing: CityCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CityCell.self))
        
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.separatorStyle = .none
        
        let searchBar = SearchBar.searchView()
        searchBar.delegate = self
        containerView.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(54)
        }
        
        tableView?.snp.makeConstraints({ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        })
        
        addLeftBarButton(title: "Отмена", action: #selector(CitiesViewController.cancelTap), target: self)
	}
    
    func configureDataSource(cities: [CityModel]) {
        citiesData = cities
        tableView?.reloadData()
    }
    
    func show(message: String) {
        showMessage(title: message)
    }
    
    @objc func cancelTap() { 
        dismiss(animated: true, completion: nil)
    }
    
}

extension CitiesViewController: SearchBarDelegate {
    func didEnterText(text: String) {
        output.handleSearchTextDidChange(searchText: text)
    }
}
