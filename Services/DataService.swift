//
//  DataService.swift
//  aStorage
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
            ProductListItemModel(
                title: "Smartphone",
                description: "Experience cutting-edge performance with the latest smartphone model. Packed with a stunning display, high-speed processor, and professional-grade camera features to keep you connected and productive on the go.",
                imageName: "image_1",
                discountPrice: "$1225.00",
                price: "$799.00"
            ),
            ProductListItemModel(
                title: "Laptop",
                description: "This lightweight yet powerful laptop is designed for students and professionals. Enjoy smooth multitasking, long battery life, and sleek portability that makes it perfect for both work and entertainment.",
                imageName: "image_2",
                discountPrice: "$1655.00",
                price: "$1199.00"
            ),
            ProductListItemModel(
                title: "Headphones",
                description: "Immerse yourself in music with these noise-cancelling wireless headphones. Enjoy crystal-clear sound, deep bass, and comfortable ear cushioning for long hours of listening without distractions.",
                imageName: "image_3",
                discountPrice: "$250.00",
                price: "$199.00"
            ),
            ProductListItemModel(
                title: "Smartwatch",
                description: "Track your health, fitness, and notifications right from your wrist. This stylish smartwatch combines modern design with advanced sensors to monitor your daily activity, heart rate, and more.",
                imageName: "image_4",
                discountPrice: "$380.00",
                price: "$299.00"
            ),
            ProductListItemModel(
                title: "Camera",
                description: "Capture your world in breathtaking detail with this high-resolution DSLR camera. Perfect for both beginners and professionals, it delivers sharp images, vibrant colors, and exceptional low-light performance.",
                imageName: "image_5",
                discountPrice: "$1025.00",
                price: "$899.00"
            ),
            ProductListItemModel(
                title: "Bluetooth Speaker",
                description: "Take your music anywhere with this portable Bluetooth speaker. Offering powerful bass, crystal-clear audio, and durable build, it’s perfect for outdoor parties, travel, or relaxing at home.",
                imageName: "image_6",
                discountPrice: "$280.00",
                price: "$149.00"
            ),
            ProductListItemModel(
                title: "Tablet",
                description: "A sleek tablet designed for reading, streaming, and light work. With its vivid display, fast processor, and portable design, it’s a versatile companion for both productivity and entertainment.",
                imageName: "image_7",
                discountPrice: "$820.00",
                price: "$499.00"
            ),
            ProductListItemModel(
                title: "Gaming Console",
                description: "Step into the next generation of gaming with this powerful console. Enjoy realistic graphics, lightning-fast load times, and a wide library of immersive games to keep you entertained for hours.",
                imageName: "image_8",
                discountPrice: "$760.00",
                price: "$499.00"
            ),
            ProductListItemModel(
                title: "Monitor",
                description: "Boost your productivity with this ultra-wide monitor designed for multitasking. Whether for gaming, creative work, or office use, it provides stunning visuals and smooth performance.",
                imageName: "image_9",
                discountPrice: "$500.00",
                price: "$299.00"
            ),
            ProductListItemModel(
                title: "Keyboard",
                description: "Enhance your typing and gaming experience with this mechanical RGB keyboard. Featuring customizable lighting effects, durable keys, and ergonomic design for maximum comfort during long use.",
                imageName: "image_10",
                discountPrice: "$230.00",
                price: "$99.00"
            ),
            ProductListItemModel(
                title: "Mouse",
                description: "This ergonomic mouse is designed for comfort and precision. With responsive tracking, customizable buttons, and sleek design, it’s ideal for gaming, office tasks, and everyday use.",
                imageName: "image_11",
                discountPrice: "$100.00",
                price: "$59.00"
            ),
            ProductListItemModel(
                title: "Printer",
                description: "An all-in-one printer that combines printing, scanning, and copying in one device. Compact yet powerful, it delivers high-quality prints and is perfect for both home and office use.",
                imageName: "image_12",
                discountPrice: "$210.00",
                price: "$179.00"
            )
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
