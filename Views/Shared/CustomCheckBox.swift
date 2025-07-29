//
//  CustomCheckBox.swift
//  mvvm_practice_1
//
//  Created by AKIJ KHAN on 2025-07-23.
//


import SwiftUI
struct CustomCheckBox: ToggleStyle{
   func makeBody(configuration: Self.Configuration) -> some View {
      HStack{
         Image(systemName: configuration.isOn ? "checkmark.square" : "square")
            .resizable()
            .frame(width:26, height:26)
            .onTapGesture {configuration.isOn.toggle()}
            configuration.label
      }
   }
}
