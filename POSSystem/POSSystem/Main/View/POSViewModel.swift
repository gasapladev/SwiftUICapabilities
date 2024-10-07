//
//  POSViewModel.swift
//  POSSystem
//
//  Created by Gasapladev on 9/27/24.
//


import SwiftUI

class POSViewModel: ObservableObject {
    @Published var items: [Item] = [
        Item(name: "Coke", price: 2.5),
        Item(name: "Iced Tea", price: 2.0),
        Item(name: "Frappuccino", price: 5.0)
    ]
    
    @Published var cart: [CartItem] = []
    
    func addItemToCart(item: Item) {
        if let index = cart.firstIndex(where: { $0.item.id == item.id }) {
            cart[index].quantity += 1
        } else {
            cart.append(CartItem(item: item, quantity: 1))
        }
    }
    
    func totalAmount() -> Double {
        return cart.reduce(0) { $0 + $1.totalPrice }
    }
    
    func clearCart() {
        cart.removeAll()
    }
}
