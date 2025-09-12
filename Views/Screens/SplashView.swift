//
//  SplashView.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//
import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    

    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack {
                Image(systemName: "swift")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                    .offset(y: viewModel.animateImage ? 0 : -UIScreen.main.bounds.height / 7)
                
                Text("aStorage")
                    .font(.system(size: 70))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(x: viewModel.animateLeftText ? 0 : -UIScreen.main.bounds.width)
                
                Text("Get new experience")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .offset(x: viewModel.animateRightText ? 0 : UIScreen.main.bounds.width)
            }
            .animation(.easeOut(duration: 1.0), value: viewModel.animateImage)
            .animation(.easeOut(duration: 1.0).delay(0.2), value: viewModel.animateLeftText)
            .animation(.easeOut(duration: 1.0).delay(0.4), value: viewModel.animateRightText)
        }
        .onAppear {
            viewModel.startApp()
        }
        .onChange(of: viewModel.isLoading) { oldValue, isLoading in
            if !isLoading {
                navigationManager.navigate(to: .onboarding)
            }
        }
    }
}
