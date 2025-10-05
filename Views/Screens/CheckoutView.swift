//
//  CheckoutView.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-09-29.
//

import SwiftUI

struct CheckoutView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    SectionHeader(title: "Deliver at")
                    Button(action: { print("eidt_action") }) {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.blue)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .clipShape(Circle())
                    }
                }
                .padding(.top, 8)
                .padding(.trailing, 16)

                Text(
                    "H-24, R-13, Nikunja2, Dhaka (north city corporation) Suite 6."
                )
                .fontWeight(.regular)
                .padding(.leading, 16).padding(.bottom, 8)
            }
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
            .padding(.horizontal)

        }
    }
}
