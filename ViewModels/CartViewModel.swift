//
//  CartViewModel.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-09-10.
//

import SwiftUI

// MARK: - Splash View & ViewModel

class CartViewModel: ObservableObject {
    
    @Published var cartItems: [CartItem] = [
            CartItem(title: "AUE e-house and akij", category: "E-book", quantity: "4pcs", price: "$280", imageName: "image_1"),
            CartItem(title: "General purification", category: "Science", quantity: "25pcs", price: "$150", imageName: "image_1"),
            CartItem(title: "Digital Maker", category: "Business", quantity: "20pc", price: "$95", imageName: "image_1"),
            CartItem(title: "Akij the Maker", category: "Astrography", quantity: "85pc", price: "$95", imageName: "image_1"),
            CartItem(title: "Digital provider", category: "Astrography", quantity: "60pc", price: "$95", imageName: "image_1"),
            CartItem(title: "Space provider and star light", category: "Galaxy", quantity: "5pc", price: "$95", imageName: "image_1"),
            CartItem(title: "Moon provider", category: "Galaxy", quantity: "111pc", price: "$95", imageName: "image_1"),
        ]
    
}
