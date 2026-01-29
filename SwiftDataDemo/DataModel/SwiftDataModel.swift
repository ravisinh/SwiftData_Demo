//
//  Item.swift
//  SwiftDataDemo
//
//  Created by Ravisinh on 23/05/24.
//

import Foundation
import SwiftData

@Model /// This property wrapper creates a table of any class
final class Item {
    
    var timestamp: Date
    
    /// Inital values
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
