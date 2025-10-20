//
//  CartItemView.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-10-20.
//

import SwiftUI

struct CartItemView: View {
    @ObservedObject var viewModel: CartViewModel
    let cartItem: CartItem
    let withAction: Bool

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
                    .frame(width: 120, height: 110)
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
                    
                    if (withAction){
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
        }
        .padding(.all, 8)
        .padding(.bottom, 4)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

