//
//  SignInView.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

struct SignInView: View {
    @StateObject private var viewModel = SignInViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject private var authService = AuthenticationService.shared
    
    var body: some View {
      
            VStack(spacing: 30) {
                
                VStack {
                    Text("Welcome Back")
                        .font(.system(size: 40, weight: .bold, design: .default))
                        .foregroundStyle(Color.black)
                    Text("Hey, Good to see you again!")
                        .font(.title2)
                        .foregroundStyle(Color.secondary)
                }
                .frame(maxHeight: .infinity, alignment: .center)
                .navigationBarBackButtonHidden(true)
                
                // Email & Password Fields
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.gray)
                        TextField("Enter email", text: $viewModel.email)
                            .textInputAutocapitalization(.never)
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
                            await viewModel.signIn()
                        }
                    }) {
                        if viewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        } else {
                            Text("Sign In")
                                .frame(width: 350, height: 60)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold))
                               
                        }
                    }
                    .cornerRadius(12)
                    .disabled(viewModel.isLoading)
                    
                    Button(action: {
                        navigationManager.navigate(to: .signUpView)
                    }){
                        HStack{
                            Text("Don't have an account,")
                                .font(.system(size: 16))
                                .foregroundStyle(Color.secondary)
                                .padding(.top)
                            Text("Sign Up")
                                .underline(true, color: .gray)
                                .font(.system(size: 16))
                                .foregroundStyle(Color.secondary)
                                .padding(.top)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 150)
                .clipShape(SingleCornerRadius(radius: 40, corners: [.topLeft, .topRight]))
        }
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: authService.isAuthenticated) { isAuthenticated in
            if isAuthenticated {
                navigationManager.navigate(to: .homeView)
            }
        }
    }
}
