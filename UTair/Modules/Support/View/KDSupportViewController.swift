//
//  SupportKDSupportViewController.swift
//  UTair
//
//  Created by Yury Loginov on 08/06/2017.
//  Copyright © 2017 UTair.KD. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController, SupportViewInput {
	
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: SupportDataSource?
	var output: SupportViewOutput!
	
	// MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		output.viewIsReady()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setWhiteStyle()
    }
	
	
	// MARK: SupportViewInput
	func setupInitialState() {
        setupNavigation()
        setupTable()
	}
    
    fileprivate func setupTable() {
        tableView.register(UINib.init(nibName: String(describing: TextCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TextCell.self))
        
        dataSource = SupportDataSource.init(items: ["Расписание рейсов", "Онлайн-табло", "Вопросы и ответы", "Связаться с UTair"])
        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    fileprivate func setupNavigation() {
        addBackButton(target: self, action: #selector(SupportViewController.actionBackTap))
        navigationController?.setWhiteStyle()
        navigationItem.title = "Справка"
    }
    
    func actionBackTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

extension SupportViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
