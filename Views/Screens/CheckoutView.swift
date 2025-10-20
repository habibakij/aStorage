//
//  CheckoutView.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-09-29.
//

import SwiftUI

struct CheckoutView: View {
    @StateObject var viewModel: CheckoutViewModel
    @EnvironmentObject private var navigationManager: NavigationManager

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Deliver To")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading)
                   
                    Text("Home")
                        .fontWeight(.regular)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    Spacer()
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
            .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
            .padding(.horizontal)
            .padding(.top, 16)

            LazyVStack(spacing: 16) {
                ForEach(viewModel.cartItems) { cartItem in
                    CartItemView(
                        viewModel: viewModel.cartViewModel,
                        cartItem: cartItem,
                        withAction: false
                    )
                }
            }
            .padding()
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                VStack(alignment: .leading) {
                    Text("$\(viewModel.grandTotal, specifier: "%.2f")")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.red)

                    Text("include 5% vat taxs")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 16)
                .onTapGesture {
                    viewModel.showSummery = true
                }
//                .sheet(isPresented: $showSummery) {
//                    PriceSummaryView(viewModel: viewModel)
//                        .presentationDetents([.height(350), .height(350)])
//                        .presentationDragIndicator(.visible)
//                }
                Spacer()
                Button(action: {
                    navigationManager
                        .navigate(to: .successView)
                }) {
                    Text("Place order")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.all, 12)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.trailing, 12)
                }
            }
            .padding(.top, 12)
            .background(.white)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Checkout").font(.system(size: 20, weight: .bold))
            }
        }
    }
}

