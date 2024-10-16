//
//  LoginView.swift
//  POSSystem
//
//  Created by Gasapladev on 10/15/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()

            TextField("Username", text: $viewModel.username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
                .autocapitalization(.none)

            SecureField("Password", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 20)

            if let error = viewModel.loginError {
                Text(error)
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
            }

            Button(action: {
                viewModel.login()
            }) {
                Text("Login")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
