//
//  SignUpViewModel.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

// MARK: - Sign Up View & ViewModel

class SignUpViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var isLoading = false
    @Published var agreedTermsCondition: Bool = false
    @Published var errorMessage = ""
    
    private let authService = AuthenticationService.shared
    
    func signUp() async {
        await MainActor.run {
            isLoading = true
            errorMessage = ""
        }
        
        let result = await authService.signUp(
            name: name,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            termsCondition: agreedTermsCondition
        )
        
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
