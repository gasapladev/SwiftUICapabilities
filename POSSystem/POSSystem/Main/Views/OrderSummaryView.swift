//
//  OrderSummaryView.swift
//  POSSystem
//
//  Created by Gasapladev on 10/15/24.
//

import SwiftUI

struct OrderSummaryView: View {
    @ObservedObject var viewModel: POSViewModel
    
    var body: some View {
        VStack {
            List(viewModel.currentOrder.items) { item in
                HStack {
                    Text(item.product.name)
                    Spacer()
                    Text("\(item.quantity) x")
                    Text(String(format: "$%.2f", item.product.price))
                    Button(action: {
                        viewModel.removeProductFromOrder(item.product)
                    }) {
                        Text("Remove")
                    }
                }
            }
            
            Spacer()
            
            Text("Total: \(String(format: "$%.2f", viewModel.currentOrder.totalAmount))")
                .font(.largeTitle)
            
            Button(action: {
                viewModel.resetOrder()
            }) {
                Text("Complete Order")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Order Summary")
    }
}

#Preview {
    OrderSummaryView(viewModel: .init())
}
