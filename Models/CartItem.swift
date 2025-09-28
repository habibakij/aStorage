//
//  CartItem.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-09-10.
//

import Foundation

// MARK: - CartItem Model
struct CartItem: Identifiable {
    let id: UUID
    let title: String
    let selBy: String
    let keywords: [String]
    let quantity: Int
    let quantityType: QuantityType
    let discountPrice: String
    let price: String
    let imageName: String

    init(
        id: UUID = UUID(),
        title: String,
        selBy: String,
        keywords: [String],
        quantity: Int,
        quantityType: QuantityType,
        discountPrice: String,
        price: String,
        imageName: String
    ) {
        self.id = id
        self.title = title
        self.selBy = selBy
        self.keywords = keywords
        self.quantity = quantity
        self.quantityType = quantityType
        self.discountPrice = discountPrice
        self.price = price
        self.imageName = imageName
    }
}

enum QuantityType: String {
    case set
    case piece
}
