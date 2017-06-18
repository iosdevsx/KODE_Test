//
//  WeatherDataSource.swift
//  UTair
//
//  Created by Юрий Логинов on 16.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

extension WeatherListViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard (items != nil) else {
            return 0
        }
        return (items?.count)!
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: WeatherCell.self)) as? WeatherCell
        let model = items?[indexPath.row]
        
        cell?.configure(hour: (model?.hour!)!, temp:(model?.temperature)!)
        return cell!
    }
}
