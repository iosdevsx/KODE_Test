//
//  KDSupportDataSource.swift
//  UTair
//
//  Created by Юрий Логинов on 09.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation
import UIKit

class SupportDataSource : NSObject, UITableViewDataSource {
    
    var items = [String]()
    
    init(items: [String]) {
        self.items = items
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TextCell.self)) as? TextCell
        cell?.configure(title: items[indexPath.row])
        return cell!
    }
    
}
