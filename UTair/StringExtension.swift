//
//  StringExtension.swift
//  UTair
//
//  Created by Юрий Логинов on 15.06.17.
//  Copyright © 2017 Юрий Логинов. All rights reserved.
//

import Foundation

extension String {
    
    func startsWith(string: String) -> Bool {
        
        guard let range = range(of: string, options:.caseInsensitive) else {
            return false
        }
        
        return range.lowerBound == startIndex
    }
    
}
