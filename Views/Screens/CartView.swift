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
                    CartItemRow(
                        viewModel: viewModel,
                        cartItem: cartItem
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
                        .navigate(to: .checkoutView(viewModel.cartItems))
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
                Text("My Cart").font(.system(size: 28, weight: .bold))
            }
        }
    }
}

// MARK: - CartItemRow Component
struct CartItemRow: View {
    @ObservedObject var viewModel: CartViewModel
    let cartItem: CartItem

    var body: some View {

        VStack(alignment: .leading, spacing: 8) {
            Text(cartItem.title)
                .font(.system(size: 20, weight: .medium))
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .lineLimit(2)

            HStack(alignment: .top, spacing: 12) {
                Image(cartItem.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 130)
                    .cornerRadius(12)
                    .clipped()

                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 4) {
                        Text("$\(cartItem.discountPrice, specifier: "%0.2f")")
                            .font(.system(size: 16, weight: .light))
                            .strikethrough(true, color: .black)
                        Text("$\(cartItem.price, specifier: "%0.2f")")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.red)
                    }

                    InfoRow(
                        label: "Quantity",
                        value:
                            "\(cartItem.quantity)\(cartItem.quantityType == .set ? " set" : " pcs")"
                    )
                    InfoRow(label: "Sell by", value: cartItem.selBy)

                    HStack {
                        ForEach(cartItem.keywords, id: \.self) {
                            keywordItem in
                            Text(keywordItem).fontWeight(.light)
                                .foregroundColor(.secondary).padding(
                                    .all,
                                    4
                                ).background(Color(.systemBackground))
                                .cornerRadius(4).shadow(
                                    color: .gray.opacity(0.2),
                                    radius: 4,
                                    x: 0,
                                    y: 2
                                )
                        }
                    }
                    .padding(.top, 4)
                    .padding(.bottom, 8)

                    HStack(spacing: 0) {
                        Button(action: {
                            viewModel.decrementOrDeleteItem(cartItem)
                        }) {
                            if cartItem.quantity == 1 {
                                Image(systemName: "trash")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .frame(width: 40, height: 28)
                            } else {
                                Text("-")
                                    .font(
                                        .system(size: 20, weight: .semibold)
                                    )
                                    .foregroundColor(.gray.opacity(0.5))
                                    .frame(width: 40, height: 28)
                            }
                        }
                        DrawPath()
                        Text("\(cartItem.quantity)")
                            .font(.system(size: 14, weight: .regular))
                            .frame(width: 40)
                        DrawPath()
                        Button(action: {
                            viewModel.incrementItem(cartItem)
                        }) {
                            Text("+")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.gray.opacity(0.5))
                                .frame(width: 40, height: 28)
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 4).stroke(
                            Color.gray.opacity(0.3),
                            lineWidth: 1
                        )
                    )

                }
            }

        }
        .padding(.all, 8)
        .padding(.bottom, 4)
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
