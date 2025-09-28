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
        CartItem(
            title: "E-Book Collection: AUE e-House",
            selBy: "M. Habib Properties",
            keywords: ["ebook", "education", "library"],
            quantity: 4,
            quantityType: .piece,
            discountPrice: "$560.00",
            price: "$280.00",
            imageName: "image_1"
        ),
        
        CartItem(
            title: "Science Purification Guide",
            selBy: "Science Fiction",
            keywords: ["science", "purification"],
            quantity: 25,
            quantityType: .piece,
            discountPrice: "$200.00",
            price: "$150.00",
            imageName: "image_2"
        ),
        
        CartItem(
            title: "Digital Business Maker",
            selBy: "Power Digital tdr",
            keywords: ["digital", "business"],
            quantity: 20,
            quantityType: .set,
            discountPrice: "$210.00",
            price: "$95.00",
            imageName: "image_3"
        ),
        
        CartItem(
            title: "Astrography by Akij",
            selBy: "Space Graphy",
            keywords: ["astrography", "akij"],
            quantity: 85,
            quantityType: .piece,
            discountPrice: "$150.00",
            price: "$84.00",
            imageName: "image_4"
        ),
        
        CartItem(
            title: "Digital Service Provider",
            selBy: "Make Digital",
            keywords: ["provider", "digital"],
            quantity: 60,
            quantityType: .set,
            discountPrice: "$840.00",
            price: "$620.00",
            imageName: "image_5"
        ),
        
        CartItem(
            title: "Galaxy & Star Light Pack",
            selBy: "A & Z co",
            keywords: ["space", "star", "galaxy"],
            quantity: 5,
            quantityType: .piece,
            discountPrice: "$240.00",
            price: "$110.00",
            imageName: "image_6"
        ),
        
        CartItem(
            title: "Moon Exploration Kit",
            selBy: "Akij Space",
            keywords: ["moon", "galaxy"],
            quantity: 111,
            quantityType: .set,
            discountPrice: "$800.00",
            price: "$710.00",
            imageName: "image_7"
        )
    ]
    
    /// Increment item quantity
       func incrementItem(_ item: CartItem) {
           if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
               cartItems[index] = CartItem(
                   id: cartItems[index].id,
                   title: cartItems[index].title,
                   selBy: cartItems[index].selBy,
                   keywords: cartItems[index].keywords,
                   quantity: cartItems[index].quantity + 1,
                   quantityType: cartItems[index].quantityType,
                   discountPrice: cartItems[index].discountPrice,
                   price: cartItems[index].price,
                   imageName: cartItems[index].imageName
               )
           }
       }
       
       /// Decrement item quantity or delete if count = 1
       func decrementOrDeleteItem(_ item: CartItem) {
           if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
               if cartItems[index].quantity > 1 {
                   cartItems[index] = CartItem(
                       id: cartItems[index].id,
                       title: cartItems[index].title,
                       selBy: cartItems[index].selBy,
                       keywords: cartItems[index].keywords,
                       quantity: cartItems[index].quantity - 1,
                       quantityType: cartItems[index].quantityType,
                       discountPrice: cartItems[index].discountPrice,
                       price: cartItems[index].price,
                       imageName: cartItems[index].imageName
                   )
               } else {
                   cartItems.remove(at: index) // delete when quantity == 1
               }
           }
       }
    
}
