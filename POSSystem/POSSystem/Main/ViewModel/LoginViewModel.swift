//
//  LoginViewModel.swift
//  POSSystem
//
//  Created by Gasapladev on 10/15/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
     var username: String = ""
     var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var loginError: String? = nil

    private let validUsername = "admin"
    private let validPassword = "password"

    func login() {
        if username == validUsername && password == validPassword {
            isAuthenticated = true
            loginError = nil
        } else {
            loginError = "Invalid username or password"
            isAuthenticated = false
        }
    }
    
    func logout() {
        isAuthenticated = false
        loginError = "Logout Success"
    }
}
