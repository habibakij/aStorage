//
//  CartView.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-09-10.
//

import SwiftUI

struct CartView: View {
    @StateObject private var viewModel = CartViewModel()
    @State private var showSummery = false
    @EnvironmentObject private var navigationManager: NavigationManager

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.cartItems) { cartItem in
                    CartItemView(
                        viewModel: viewModel,
                        cartItem: cartItem,
                        withAction: true
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
                    showSummery = true
                }
                .sheet(isPresented: $showSummery) {
                    PriceSummaryView(viewModel: viewModel)
                        .presentationDetents([.height(350), .height(350)])
                        .presentationDragIndicator(.visible)
                }
                Spacer()
                Button(action: {
                    navigationManager
                        .navigate(to: .checkoutView(cartItems: viewModel.cartItems))
                }) {
                    Text("Checkout")
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
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(false)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("My Cart")
                    .font(.system(size: 20, weight: .bold))
            }
        }
    }
}

// MARK: - InfoRow Component
struct InfoRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack(alignment: .center, spacing: 4) {
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

struct PriceSummaryView: View {
    @ObservedObject var viewModel: CartViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Subtotal (5)")
                    Spacer()
                    Text("$\(viewModel.basePrice, specifier: "%.2f")")
                }
                if viewModel.discountAmount > 0 {
                    HStack {
                        Text("You save")
                        Spacer()
                        Text("-$\(viewModel.discountAmount, specifier: "%.2f")")
                            .foregroundColor(.red)
                    }
                }
                HStack {
                    Text("Vat & taxs")
                    Spacer()
                    Text("+\(viewModel.vatTax, specifier: "%.2f")")
                }
                HStack {
                    Text("Total")
                        .fontWeight(.bold)
                    Spacer()
                    Text("$\(viewModel.grandTotal, specifier: "%.2f")")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("Price Summary")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                }
            }
        }
    }
}

struct DrawPath: View {
    var body: some View {
        Path {
            myPath in
            myPath.move(to: CGPoint(x: 0, y: 0))
            myPath.addLine(to: CGPoint(x: 0, y: 28))
        }.stroke(Color.gray.opacity(0.3), lineWidth: 1)
            .frame(width: 2, height: 28)
    }
}
