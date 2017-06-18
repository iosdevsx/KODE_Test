//
//  KDFlightsDataSource.swift
//  UTair
//
//  Created by Юрий Логинов on 12.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

extension FlightsViewController : UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfElements
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell.init()
        
        if indexPath.row == 0 {
            cell = (tableView.dequeueReusableCell(withIdentifier: String(describing: CitiesCell.self)) as? CitiesCell)!
            (cell as! CitiesCell).delegate = self
            cell.backgroundColor = UIColor.clear
        }
        
        if indexPath.row == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DatesCell.self)) as! DatesCell
            (cell as! DatesCell).setup()
            (cell as! DatesCell).delegate = self
            cell.backgroundColor = UIColor.clear
        }
        
        if indexPath.row == 2 {
            cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PersonCell.self)) as! PersonCell
            (cell as! PersonCell).setup()
            cell.backgroundColor = UIColor.clear
        }
        
        return cell
    }
}

extension FlightsViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150
        }
        if indexPath.row == 1 {
            return 90
        }
        if indexPath.row == 2 {
            return 93
        }
        return 70
    }
}
