//
//  SplashView.swift
//  mvvm_practice_1
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "swift")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                
                Text("aStorage with MVVM Pattern")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .padding(.top)
                }
            }
        }
        .onAppear {
            viewModel.startApp()
        }
        .onChange(of: viewModel.isLoading) {oldValue, isLoading in
            if !isLoading {
                navigationManager.navigate(to: .onboarding)
            }
        }
    }
}
