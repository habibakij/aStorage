//
//  SuccessView.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-08-31.
//

import SwiftUI

struct SuccessView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            ZStack {
                Circle()
                    .fill(Color.green.opacity(0.2))
                    .frame(width: 120, height: 120)
                
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.green)
                    .frame(width: 100, height: 100)
            }
            
            Text("Your purchase has been\nconfirmed")
                .font(.title)
                .multilineTextAlignment(.center)
                .fontWeight(.semibold)
                .foregroundColor(.green)
            
            Spacer()
            
            Button(action: {
                navigationManager.navigate(to: .home)
            }) {
                Text("Go to Home")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
                    .padding(.horizontal)
                
            }.padding(.bottom, 12)
            
        }
        
    }
}
