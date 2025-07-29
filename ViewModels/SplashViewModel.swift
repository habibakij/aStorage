//
//  SplashView.swift
//  mvvm_practice_1
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

// MARK: - Splash View & ViewModel

class SplashViewModel: ObservableObject {
    @Published var isLoading = true
    
    func startApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLoading = false
        }
    }
}
