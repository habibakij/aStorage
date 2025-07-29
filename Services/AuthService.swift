//
//  SplashView.swift
//  mvvm_practice_1
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import Foundation

// MARK: - Authentication Service

class AuthenticationService: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    
    static let shared = AuthenticationService()
    
    private init() {}
    
    func signIn(email: String, password: String) async -> Result<User, AuthError> {
        // Simulate API call
        try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay
        
        // Simple validation
        guard !email.isEmpty, !password.isEmpty else {
            return .failure(.invalidCredentials)
        }
        
        guard email.contains("@") else {
            return .failure(.invalidEmail)
        }
        
        // Mock successful login
        let user = User(id: UUID().uuidString, name: "John Doe", email: email)
        
        await MainActor.run {
            self.currentUser = user
            self.isAuthenticated = true
        }
        
        return .success(user)
    }
    
    func signUp(name: String, email: String, password: String, confirmPassword: String, termsCondition: Bool) async -> Result<User, AuthError> {
        // Simulate API call
        try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay
        
        // Validation
        guard !name.isEmpty, !email.isEmpty, !password.isEmpty else {
            return .failure(.missingFields)
        }
        
        guard email.contains("@") else {
            return .failure(.invalidEmail)
        }
        
        guard password == confirmPassword else {
            return .failure(.passwordMismatch)
        }
        
        guard password.count >= 6 else {
            return .failure(.weakPassword)
        }
        
        guard !termsCondition else {
            return .failure(.termsConditionNotAccepted)
        }
        
        // Mock successful registration
        let user = User(id: UUID().uuidString, name: name, email: email)
        
        await MainActor.run {
            self.currentUser = user
            self.isAuthenticated = true
        }
        
        return .success(user)
    }
    
    func signOut() {
        currentUser = nil
        isAuthenticated = false
    }
}

