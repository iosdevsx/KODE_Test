//
//  KDCitiesDataSource.swift
//  UTair
//
//  Created by Юрий Логинов on 15.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import UIKit

extension CitiesViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard (citiesData != nil) else {
            return 0
        }
        return (citiesData?.count)!
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CityCell.self)) as? CityCell
        cell?.configure(city: (citiesData?[indexPath.row])!)
        return cell!
    }
}

extension CitiesViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.handleSelectedCity(city: (citiesData?[indexPath.row].city)!)
    }
}
