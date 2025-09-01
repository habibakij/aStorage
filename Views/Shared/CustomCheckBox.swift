//
//  CustomCheckBox.swift
//  mvvm_practice_1
//
//  Created by AKIJ KHAN on 2025-07-23.
//


import SwiftUI

struct BlueBackgroundCheckBox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            ZStack {
                Rectangle()
                    .fill(configuration.isOn ? Color.blue : Color.clear)
                    .frame(width: 26, height: 26)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                if configuration.isOn {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                }
            }
            configuration.label
        }
        .onTapGesture {
            withAnimation {
                configuration.isOn.toggle()
            }
        }
    }
}
