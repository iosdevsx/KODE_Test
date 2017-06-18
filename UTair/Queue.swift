//
//  Queue.swift
//  UTair
//
//  Created by Юрий Логинов on 09.06.17.
//  Copyright © 2017 Yury Loginov. All rights reserved.
//

import Foundation


internal struct Queue<T> {
    
    var first, last: Node<T>?
    
    mutating func dequeue() -> T? {
        let pop = first?.data
        first = first?.next
        if first == nil {
            last = nil
        }
        return pop
    }
    
    mutating func enqueue(data: T) {
        if last == nil {
            first = Node(data: data)
            last = first
        } else {
            last?.next = Node(data: data)
            last = last?.next
        }
    }
    
    mutating func isEmpty() -> Bool {
        return first == nil
    }
}

internal class Node<T> {
    
    var data: T
    var next: Node<T>?
    
    init(data: T) {
        self.data = data
    }
}
