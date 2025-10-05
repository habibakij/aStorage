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
        GeometryReader { geo in
            ZStack {
                Color.blue.ignoresSafeArea()

                VStack {
                    Image(systemName: "swift")
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                        .offset(y: viewModel.animateImage ? 0 : -geo.size.height / 7)
                        .animation(.easeOut(duration: 1.0), value: viewModel.animateImage)

                    Text("aStorage")
                        .font(.system(size: 70, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .offset(x: viewModel.animateLeftText ? 0 : -geo.size.width)
                        .animation(.easeOut(duration: 1.0).delay(0.2), value: viewModel.animateLeftText)

                    Text("Get new experience")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .offset(x: viewModel.animateRightText ? 0 : geo.size.width)
                        .animation(.easeOut(duration: 1.0).delay(0.4), value: viewModel.animateRightText)
                }
            }
        }
        .onAppear {
            viewModel.startApp()
        }
        .onChange(of: viewModel.isLoading) {_, isLoading in
            if !isLoading {
                navigationManager.navigate(to: .onboardingView)
            }
        }
    }
}
