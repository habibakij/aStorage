//
//  NavigationDestination.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

// MARK: - NavigationDestination

enum NavigationDestination: Hashable {
    case onboardingView
    case signInView
    case signUpView
    case homeView
    case itemDetailView(ProductListItemModel)
    case bookingView
    case successView
    case cartView
    case checkoutView(cartItems: [CartItem])
}
