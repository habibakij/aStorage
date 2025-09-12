//
//  BookingViewModel.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-08-03.
//

import SwiftUI

// MARK: - Onboarding View & ViewModel

class BookingViewModel: ObservableObject {
    @Published var selectedPaymentOption: PaymentOption? = nil
    
    let paymentOptionList: [PaymentOption] = [
           PaymentOption(title: "Cash", imageName: "cash"),
           PaymentOption(title: "Visa", imageName: "visa"),
           PaymentOption(title: "MasterCard", imageName: "mastercard"),
           PaymentOption(title: "Bkash", imageName: "bkash"),
           PaymentOption(title: "Americal Express", imageName: "american_express"),
           PaymentOption(title: "Rocket", imageName: "rocket"),
           PaymentOption(title: "Nagad", imageName: "nagad")
    ];
}
