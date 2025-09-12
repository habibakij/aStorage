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
                    case .onboarding:
                        OnboardingView()
                    case .signIn:
                        SignInView()
                    case .signUp:
                        SignUpView()
                    case .home:
                        HomeView()
                    case .itemDetail(let item):
                        ItemDetailView(item: item)
                    case .booking:
                        BookingView()
                    case .success:
                        SuccessView()
                    case .cartView:
                        CartView()
                    }
                }
        }
        .environmentObject(navigationManager)
    }
}
