//
//  CartView.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-09-10.
//

import SwiftUI

struct CartView: View {
    @StateObject private var viewModel = CartViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.cartItems) { cartItem in
                    CartItemRow(cartItem: cartItem)
                }
            }
            .padding()
        }
        
        .navigationBarHidden(false)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Booking Preview")
                            .font(.system(size: 28, weight: .bold))
                    }
                }
        
    }
}

// MARK: - CartItemRow Component
struct CartItemRow: View {
    let cartItem: CartItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Image
            Image(cartItem.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 100)
                .cornerRadius(12)
                .clipped()
            
            // Content
            VStack(alignment: .leading, spacing: 8) {
                Text(cartItem.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                
                InfoRow(label: "Category:", value: cartItem.category)
                InfoRow(label: "Quantity:", value: cartItem.quantity)
                InfoRow(label: "Price:", value: cartItem.price)
            }
            
            Spacer()
        }
        .padding(.all, 8)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

// MARK: - InfoRow Component
struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(.secondary)
            
            Text(value)
                .font(.subheadline)
                .fontWeight(.regular)
            
            Spacer()
        }
    }
}
