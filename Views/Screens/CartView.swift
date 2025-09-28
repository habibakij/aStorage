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
                    CartItemRow(
                        viewModel: viewModel,
                        cartItem: cartItem
                    )
                }
            }
            .padding()
        }
        .safeAreaInset(edge: .bottom) {
            HStack{
               
                VStack(alignment: .leading){
                    Text("$528.00")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                    Text("Less $28.00")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                }
                Spacer()
                Button(action: {
                    
                }) {
                    Text("Checkout")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding(.top, 12)
            .padding(.horizontal)
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
                    .frame(width: 120, height: 100)
                    .cornerRadius(12)
                    .clipped()

                VStack(alignment: .leading, spacing: 0) {

                    HStack(spacing: 4) {
                        Text(cartItem.discountPrice)
                            .font(.system(size: 16, weight: .light))
                            .strikethrough(true, color: .black)
                        Text(cartItem.price)
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
                    .padding(.vertical, 4)

                    HStack(spacing: 0) {
                        Button(action: {
                            viewModel.decrementOrDeleteItem(cartItem)
                        }) {
                            if cartItem.quantity == 1 {
                                Image(systemName: "trash")
                                    .foregroundColor(.gray)
                                    .frame(width: 40, height: 30)
                            } else {
                                Text("-")
                                    .font(
                                        .system(size: 20, weight: .semibold)
                                    )
                                    .foregroundColor(.black)
                                    .frame(width: 40, height: 30)
                            }
                        }
                        DrawPath()
                        Text("\(cartItem.quantity)")
                            .font(.system(size: 18, weight: .regular))
                            .frame(width: 40)
                        DrawPath()
                        Button(action: {
                            viewModel.incrementItem(cartItem)
                        }) {
                            Text("+")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.black)
                                .frame(width: 40, height: 30)
                        }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 6).stroke(
                            Color.gray,
                            lineWidth: 1
                        )
                    )

                }
            }

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

struct DrawPath: View {
    var body: some View {
        Path {
            myPath in
            myPath.move(to: CGPoint(x: 0, y: 0))
            myPath.addLine(to: CGPoint(x: 0, y: 34))
        }.stroke(Color.gray, lineWidth: 1)
            .frame(width: 2, height: 34)
    }
}
