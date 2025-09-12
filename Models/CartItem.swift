//
//  CartItem.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-09-10.
//

import Foundation

// MARK: - CartItem Model
struct CartItem: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let quantity: String
    let price: String
    let imageName: String
}
