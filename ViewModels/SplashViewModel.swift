//
//  SplashViewModel.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

// MARK: - Splash View & ViewModel

@MainActor
class SplashViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var animateImage = false
    @Published var animateLeftText = false
    @Published var animateRightText = false
    private var hasStarted = false

    func startApp() {
        guard !hasStarted else { return }
        hasStarted = true

        Task { @MainActor in
            animateImage = true
            try? await Task.sleep(nanoseconds: 200_000_000) // 0.2s
            animateLeftText = true
            try? await Task.sleep(nanoseconds: 200_000_000) // +0.2s
            animateRightText = true
            try? await Task.sleep(nanoseconds: 3_600_000_000) // ~3.6s
            isLoading = false
        }
    }
}
