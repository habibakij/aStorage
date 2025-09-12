//
//  SplashViewModel.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

// MARK: - Splash View & ViewModel

class SplashViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var animateImage = false
    @Published var animateLeftText = false
    @Published var animateRightText = false
    
    func startApp() {
        // Trigger animations
        withAnimation {
            animateImage = true
        }
        withAnimation(.easeOut(duration: 1.0).delay(0.2)) {
            animateLeftText = true
        }
        withAnimation(.easeOut(duration: 1.0).delay(0.4)) {
            animateRightText = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.isLoading = false
        }
    }
}
