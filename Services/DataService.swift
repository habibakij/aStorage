//
//  SplashView.swift
//  mvvm_practice_1
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import Foundation

// MARK: - Data Service

class DataService {
    static let shared = DataService()
    
    private init() {}
    
    func fetchAllProducts() async -> [ProductListItemModel] {
        // Simulate API call
        try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay
        
        return [
            ProductListItemModel(title: "Smartphone", description: "Latest model with advanced features", imageName: "image_1", price: "$799"),
            ProductListItemModel(title: "Laptop", description: "Lightweight and powerful for daily use", imageName: "image_2", price: "$1199"),
            ProductListItemModel(title: "Headphones", description: "Noise-cancelling wireless headphones", imageName: "image_3", price: "$199"),
            ProductListItemModel(title: "Smartwatch", description: "Track your fitness and notifications", imageName: "image_4", price: "$299"),
            ProductListItemModel(title: "Camera", description: "High-resolution DSLR camera", imageName: "image_5", price: "$899"),
            ProductListItemModel(title: "Bluetooth Speaker", description: "Portable speaker with rich sound", imageName: "image_6", price: "$149"),
            ProductListItemModel(title: "Tablet", description: "Perfect for reading and light work", imageName: "image_7", price: "$499"),
            ProductListItemModel(title: "Gaming Console", description: "Next-gen console for immersive games", imageName: "image_8", price: "$499"),
            ProductListItemModel(title: "Monitor", description: "Ultra-wide monitor for multitasking", imageName: "image_9", price: "$299"),
            ProductListItemModel(title: "Keyboard", description: "Mechanical keyboard with RGB lighting", imageName: "image_10", price: "$99"),
            ProductListItemModel(title: "Mouse", description: "Ergonomic and responsive mouse", imageName: "image_11", price: "$59"),
            ProductListItemModel(title: "Printer", description: "All-in-one color printer", imageName: "image_12", price: "$179")
        ]
    }
    
    func fetchCategories() async -> [CategoryListItemModel] {
        // Simulate API call
        try? await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay
        
        return [
            CategoryListItemModel(categoryTitle: "Home", categoryImage: "house.fill"),
            CategoryListItemModel(categoryTitle: "Shopping", categoryImage: "cart.fill"),
            CategoryListItemModel(categoryTitle: "Favorites", categoryImage: "heart.fill"),
            CategoryListItemModel(categoryTitle: "Profile", categoryImage: "person.fill"),
            CategoryListItemModel(categoryTitle: "Settings", categoryImage: "gear"),
            CategoryListItemModel(categoryTitle: "Notifications", categoryImage: "bell.fill"),
            CategoryListItemModel(categoryTitle: "Saved", categoryImage: "bookmark.fill"),
            CategoryListItemModel(categoryTitle: "Camera", categoryImage: "camera.fill")
        ]
    }
}
