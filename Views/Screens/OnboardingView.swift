//
//  SplashView.swift
//  mvvm_practice_1
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        VStack(spacing: 0) {
            // Top content
            VStack {
                Text("Get Started")
                    .font(.system(size: 54, weight: .bold, design: .default))
                    .foregroundStyle(Color.black)
                Text("Start with sign in and sign up")
                    .font(.title2)
                    .foregroundStyle(Color.secondary)
            }
            .frame(maxHeight: .infinity, alignment: .center)
            
            VStack() {
                Button(action: {
                    navigationManager.navigate(to: .signUp)
                }) {
                    Text("Sign Up")
                        .frame(width: 280, height: 60, alignment: .center)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .cornerRadius(32)
                }
                
                Spacer().frame(height: 12)
                
                Button(action: {
                    navigationManager.navigate(to: .signIn)
                }) {
                    Text("Sign In")
                        .frame(width: 280, height: 60, alignment: .center)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .cornerRadius(32)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical, 50)
            .background(Color.blue)
            .clipShape(SingleCornerRadius(radius: 60, corners: [.topLeft]))
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .navigationBarBackButtonHidden(true)
    }
}
