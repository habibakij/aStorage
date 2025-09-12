
//
//  ProductListItemModel.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-24.
//

import SwiftUI
struct ProductListItemModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
    let price: String
}
