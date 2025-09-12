//
//  NavigationDestination.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

// MARK: - NavigationDestination

enum NavigationDestination: Hashable {
    case onboarding
    case signIn
    case signUp
    case home
    case itemDetail(ProductListItemModel)
    case booking
    case success
    case cartView
}
