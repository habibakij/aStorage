//
//  HeaderText.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-10-05.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
}
