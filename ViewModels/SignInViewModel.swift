//
//  SignInViewModel.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

// MARK: - Sign In View & ViewModel

class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage = ""
    
    private let authService = AuthenticationService.shared
    
    func signIn() async {
        await MainActor.run {
            isLoading = true
            errorMessage = ""
        }
        
        let result = await authService.signIn(email: email, password: password)
        
        await MainActor.run {
            isLoading = false
            switch result {
            case .success:
                break
            case .failure(let error):
                errorMessage = error.localizedDescription
            }
        }
    }
}
