//
//  ProductItemView.swift
//  aStorage
//
//  Created by USER on 2025-07-24.
//

import SwiftUI

struct ProductItemView: View {
    let product: ProductListItemModel
    let index: Int
    let onTab: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: (UIScreen.main.bounds.width - 60) / 2, height: 150)
                .clipped()
                .cornerRadius(12)

            Text(product.title)
                .font(.system(size: 18, weight: .bold))
                .lineLimit(1)
                .padding(.top, 8)

            Text(product.description)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .lineLimit(2)

            HStack(alignment: .center) {
                HStack(spacing: 2){
                    Text(product.discountPrice)
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(.red)
                        .strikethrough(true, color: .red)
                    Text(product.price).font(.system(size: 16, weight: .bold))
                        .foregroundColor(.blue)
                }

                Spacer()

                Text(index % 2 == 0 ? "M" : "F")
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(6)
                    .fontWeight(.bold)
            }
            .padding(.top, 2)
        }
        .frame(width: (UIScreen.main.bounds.width - 60) / 2)
        .onTapGesture {
            onTab()
        }
    }
}
