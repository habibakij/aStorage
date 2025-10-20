//
//  SignUpView.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject private var authService = AuthenticationService.shared
    
    var body: some View {
        VStack(spacing: 30) {
            
            VStack {
                Text("Sign Up")
                    .font(.system(size: 60, weight: .bold, design: .default))
                    .foregroundStyle(Color.black)
                Text("Hello, let's join with us")
                    .font(.title2)
                    .foregroundStyle(Color.secondary)
            }
            .frame(maxHeight: .infinity, alignment: .center)
            .navigationBarBackButtonHidden(true)
            
            // Form Fields
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    TextField("Enter name", text: $viewModel.name)
                        .autocapitalization(.none)
                }
                .padding(16)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 1)
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    TextField("Enter email", text: $viewModel.email)
                        .autocapitalization(.none)
                }
                .padding(16)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 1)
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "lock")
                        .foregroundColor(.gray)
                    SecureField("Enter password", text: $viewModel.password)
                }
                .padding(16)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 1)
                .padding(.horizontal)
                
                HStack {
                    Image(systemName: "lock.rotation")
                        .foregroundColor(.gray)
                    SecureField("Confirm password", text: $viewModel.confirmPassword)
                }
                .padding(16)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 1)
                .padding(.horizontal)
                
                Toggle(isOn: $viewModel.agreedTermsCondition) {
                    Text("Agree with terms and conditions")
                        .foregroundColor(.primary)
                }
                .toggleStyle(BlueBackgroundCheckBox())
                .padding()
                .padding(.leading, 6)
            }
            .frame(maxHeight: .infinity, alignment: .center)
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .font(.system(size: 18, weight: .medium))
                    .fontWeight(.bold)
            }
            
            VStack{
                Button(action: {
                    Task {
                        await viewModel.signUp()
                    }
                }) {
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    } else {
                        Text("Sign Up")
                            .frame(width: 350, height: 60)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                    }
                }
                .cornerRadius(12)
                .disabled(viewModel.isLoading)
                
                Button(action: {
                    navigationManager.navigate(to: .signInView)
                }) {
                    HStack{
                        Text("Already have an account,")
                            .font(.system(size: 16))
                            .foregroundStyle(Color.secondary)
                            .padding(.top)
                        Text("Sign In")
                            .underline(true, color: .gray)
                            .font(.system(size: 16))
                            .foregroundStyle(Color.secondary)
                            .padding(.top)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 120)
            .clipShape(SingleCornerRadius(radius: 40, corners: [.topLeft,.topRight]))
        }
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: authService.isAuthenticated) {isAuthenticated in
            if isAuthenticated {
                navigationManager.navigate(to: .homeView)
            }
        }
    }
}
