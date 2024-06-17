//
//  Item.swift
//  sugumogu
//
//  Created by AkashiTakumi on 2024/06/18.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
