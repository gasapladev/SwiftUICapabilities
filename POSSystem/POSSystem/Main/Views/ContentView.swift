//
//  ContentView.swift
//  POSSystem
//
//  Created by Gasapladev on 10/15/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = POSViewModel()
    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var coordinator = POSCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            if !coordinator.isAuthenticated {
                LoginView(viewModel: loginViewModel)
                    .onChange(of: loginViewModel.isAuthenticated, { oldValue, newValue in
                        if newValue {
                            coordinator.loginSuccess()
                        }
                    })
            } else {
                VStack {
                    ProductListView(viewModel: viewModel)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    coordinator.navigateToOrderSummary()
                                }) {
                                    Text("Cart")
                                }
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    viewModel.resetOrder()
                                    loginViewModel.logout()
                                    coordinator.logout()
                                }) {
                                    Text("Logout")
                                }
                            }
                        }
                        .navigationDestination(for: POSCoordinator.NavigationScreen.self) { screen in
                            switch screen {
                            case .orderSummary:
                                OrderSummaryView(viewModel: viewModel)
                            case .productList:
                                ProductListView(viewModel: viewModel)
                            default:
                                EmptyView()
                            }
                        }
                }
                VStack {
                    Text("Total: $\(viewModel.currentOrder.totalAmount, specifier: "%.2f")")
                        .font(.headline)
                        .padding()
                    NavigationLink(destination: OrderSummaryView(viewModel: viewModel)) {
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
//        .onAppear {
//            coordinator.start()
//        }
    }
}

//#Preview {
//    ContentView(viewModel: .init())
//}

