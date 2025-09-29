//
//  CheckoutViewModel.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-09-29.
//

import Foundation
import SwiftUI

class CheckoutViewModel: ObservableObject {
    @ObservedObject var cartVM: CartViewModel

        init(cartVM: CartViewModel) {
            self.cartVM = cartVM
        }

}
