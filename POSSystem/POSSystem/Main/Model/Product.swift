//
//  CartItem.swift
//  POSSystem
//
//  Created by Gasapladev on 7/12/24.
//
import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
}

struct OrderItem: Identifiable {
    let id = UUID()
    var product: Product
    var quantity: Int
}

struct Order {
    var items: [OrderItem] = []
    
    var totalAmount: Double {
        return items.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
}
