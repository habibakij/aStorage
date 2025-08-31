//
//  SplashView.swift
//  mvvm_practice_1
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

// MARK: - Home View & ViewModel

class HomeViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var categoryList: [CategoryListItemModel] = []
    @Published var productList: [ProductListItemModel] = []
    @Published var isLoading = false
    @Published var errorMessage = ""
    
    private let dataService = DataService.shared
    
    func loadItems() async {
        // Only show loading if we don't have data yet
        let shouldShowLoading = categoryList.isEmpty && productList.isEmpty
               
        await MainActor.run {
            isLoading = shouldShowLoading
            errorMessage = ""
        }
        
        let fetchedAllCategories = await dataService.fetchCategories()
        let fetchedAllProducts = await dataService.fetchAllProducts()
        
        await MainActor.run {
            self.categoryList = fetchedAllCategories
            self.productList = fetchedAllProducts
            self.isLoading = false
        }
    }
}
