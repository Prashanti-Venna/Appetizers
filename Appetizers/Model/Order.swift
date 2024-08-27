//
//  Order.swift
//  Appetizers
//
//  Created by Prashanti Venna on 15/08/2024.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price}
    }
    
    var orderCount: Int {
        return items.count
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItems(_ offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
}
