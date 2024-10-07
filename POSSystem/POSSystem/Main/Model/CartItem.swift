//
//  CartItem.swift
//  POSSystem
//
//  Created by Gasapladev on 7/12/24.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
}

struct CartItem: Identifiable {
    let id = UUID()
    
    let item: Item
    var quantity: Int
    var totalPrice: Double {
        return item.price * Double(quantity)
    }
}
