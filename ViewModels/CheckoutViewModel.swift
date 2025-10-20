//
//  CheckoutViewModel.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-09-29.
//

import Foundation
import SwiftUI

class CheckoutViewModel: ObservableObject {
    @Published var cartViewModel = CartViewModel()
    @Published var showSummery = false
    @Published var cartItems: [CartItem] = []
        
        init(cartItems: [CartItem]) {
            self.cartItems = cartItems
        }

    var subTotal: Double {
        cartItems.reduce(0) { $0 + $1.price * Double($1.quantity) }
    }

    var basePrice: Double {
        cartItems.reduce(0) { $0 + $1.discountPrice * Double($1.quantity) }
    }

    var discountAmount: Double {
        basePrice - subTotal
    }

    var vatTax: Double {
        subTotal / 100 * 5
    }
    
    var grandTotal: Double {
        subTotal + vatTax
    }
}
