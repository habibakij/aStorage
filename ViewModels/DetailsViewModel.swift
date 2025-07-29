//
//  SplashView.swift
//  mvvm_practice_1
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

// MARK: - Item Detail View & ViewModel

class ItemDetailViewModel: ObservableObject {
    @Published var item: ProductListItemModel
    
    init(item: ProductListItemModel) {
        self.item = item
    }
    
    // Add any detail-specific logic here
    func performAction() {
        // Example action
        print("Action performed on \(item.id)")
    }
}
