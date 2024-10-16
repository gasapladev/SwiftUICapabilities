//
//  ContentView.swift
//  POSSystem
//
//  Created by Gasapladev on 5/29/24.
//
import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel: POSViewModel

    var body: some View {
        List(viewModel.products) { product in
            HStack {
                Text(product.name)
                Spacer()
                Text(String(format: "$%.2f", product.price))
                Button(action: {
                    viewModel.addProductToOrder(product)
                }) {
                    Text("Add")
                }
            }
        }
        .navigationTitle("Products")
    }
}


#Preview {
    ProductListView(viewModel: POSViewModel())
}
