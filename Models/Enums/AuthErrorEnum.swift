//
//  AuthError.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import Foundation

enum AuthError: LocalizedError {
    case invalidCredentials
    case invalidEmail
    case missingFields
    case passwordMismatch
    case weakPassword
    case termsConditionNotAccepted
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Invalid email or password"
        case .invalidEmail:
            return "Please enter a valid email address"
        case .missingFields:
            return "Please fill required fields"
        case .passwordMismatch:
            return "Passwords not matching"
        case .weakPassword:
            return "Password must be at least 6 characters"
        case .termsConditionNotAccepted:
            return "Please accept the terms and conditions"
        }
    }
}
