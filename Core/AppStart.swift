//
//  AppStartView.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

// MARK: - Main Content View (Navigation Controller)

import SwiftUI

struct AppStartView: View {
    @StateObject private var navigationManager = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            SplashView()
                .navigationDestination(for: NavigationDestination.self) { destination in
                    switch destination {
                    case .onboardingView:
                        OnboardingView()
                    case .signInView:
                        SignInView()
                    case .signUpView:
                        SignUpView()
                    case .homeView:
                        HomeView()
                    case .itemDetailView(let item):
                        DetailView(item: item)
                    case .bookingView:
                        BookingView()
                    case .successView:
                        SuccessView()
                    case .cartView:
                        CartView()
                    case .checkoutView(let cartItems):
                        CheckoutView(viewModel: CheckoutViewModel(cartItems: cartItems))
                    }
                }
        }
        .environmentObject(navigationManager)
    }
}
