//
//  ContentView.swift
//  POSSystem
//
//  Created by Gasapladev on 5/29/24.
//

import SwiftUI

struct PosView: View {
    @StateObject private var viewModel = POSViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text("$\(item.price, specifier: "%.2f")")
                        Button(action: {
                            viewModel.addItemToCart(item: item)
                        }) {
                            Text("Add")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .navigationTitle("Items")
                
                VStack {
                    Text("Total: $\(viewModel.totalAmount(), specifier: "%.2f")")
                        .font(.headline)
                        .padding()
                    
//                    NavigationLink(destination: CartView(cart: viewModel.cart)) {
//                        Text("View Cart")
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
                    NavigationLink(destination: CartView(viewModel: viewModel)) {
                        Text("View Cart")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
    }
}

struct CartView: View {
    //var cart: [CartItem]
    @ObservedObject var viewModel: POSViewModel // Make sure to pass the view model
    
    var body: some View {
//        List(cart) { cartItem in
//            HStack {
//                Text(cartItem.item.name)
//                Spacer()
//                Text("\(cartItem.quantity) x $\(cartItem.item.price, specifier: "%.2f")")
//                Text("= $\(cartItem.totalPrice, specifier: "%.2f")")
//            }
//        }
//        .navigationTitle("Cart")
        List(viewModel.cart) { cartItem in
                      HStack {
                          Text(cartItem.item.name)
                          Spacer()
                          Text("\(cartItem.quantity) x $\(cartItem.item.price, specifier: "%.2f")")
                          Text("= $\(cartItem.totalPrice, specifier: "%.2f")")
                      }
                  }
                  .navigationTitle("Cart")
        // Button to clear the cart
        Button(action: {
            viewModel.clearCart()
        }) {
            Text("Clear Cart")
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    PosView()
}
