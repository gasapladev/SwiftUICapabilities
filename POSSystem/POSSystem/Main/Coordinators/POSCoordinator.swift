//
//  POSCoordinator.swift
//  POSSystem
//
//  Created by Gasapladev on 10/15/24.
//

import SwiftUI

import SwiftUI

class POSCoordinator: ObservableObject {
    @Published var navigationPath = [NavigationScreen]()
    @Published var isAuthenticated = false
    
    enum NavigationScreen: Identifiable {
        case login
        case productList
        case orderSummary

        var id: UUID {
            return UUID()
        }
    }
    
    func start() {
        if !isAuthenticated {
            navigateToLogin()
        } else {
            navigateToProductList()
        }
    }
    
    func logout() {
        isAuthenticated = false
        navigationPath.removeAll()
        //navigationPath.append(.login)
    }
    
    func navigateToLogin() {
        navigationPath.append(.login)
    }
    
    func navigateToProductList() {
        navigationPath.append(.productList)
    }
    
    func navigateToOrderSummary() {
        navigationPath.append(.orderSummary)
    }
    
    func loginSuccess() {
        isAuthenticated = true
        navigationPath.removeAll()
        //navigateToProductList()
    }
}
