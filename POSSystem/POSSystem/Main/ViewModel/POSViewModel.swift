//
//  POSViewModel.swift
//  POSSystem
//
//  Created by Gasapladev on 9/27/24.
//
import Foundation
import Combine

class POSViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(name: "Coffee", price: 2.50),
        Product(name: "Bagel", price: 1.50),
        Product(name: "Sandwich", price: 4.00)
    ]
    
    @Published var currentOrder = Order()
    
    func addProductToOrder(_ product: Product) {
        if let index = currentOrder.items.firstIndex(where: { $0.product.id == product.id }) {
            currentOrder.items[index].quantity += 1
        } else {
            currentOrder.items.append(OrderItem(product: product, quantity: 1))
        }
    }
    
    func removeProductFromOrder(_ product: Product) {
        if let index = currentOrder.items.firstIndex(where: { $0.product.id == product.id }) {
            let item = currentOrder.items[index]
            if item.quantity > 1 {
                currentOrder.items[index].quantity -= 1
            } else {
                currentOrder.items.remove(at: index)
            }
        }
    }
    
    func resetOrder() {
        currentOrder = Order()
    }
}

