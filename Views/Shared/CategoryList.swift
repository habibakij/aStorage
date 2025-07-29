//
//  category_item.swift
//  akStorage
//
//  Created by AKIJ KHAN on 2025-07-02.
//

import SwiftUI


struct CategoryListView: View {
    let categoryList: [CategoryListItemModel]
    @State private var selectedCategory: CategoryListItemModel?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                ForEach(categoryList) { category in
                    CategoryChip(
                        category: category,
                        isSelected: selectedCategory?.id == category.id
                    ) {
                        selectedCategory = category
                        print("Selected: \(category.categoryTitle)")
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
    }
}

struct CategoryChip: View {
    let category: CategoryListItemModel
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            Label(category.categoryTitle, systemImage: category.categoryImage)
                .font(.system(size: 14, weight: .medium))
                .labelStyle(CategoryLabelStyle(isSelected: isSelected))
        }
        .buttonStyle(CategoryButtonStyle(isSelected: isSelected))
    }
}

// Custom Label Style
struct CategoryLabelStyle: LabelStyle {
    let isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 6) {
            configuration.icon
                .font(.system(size: 12))
                .foregroundColor(isSelected ? .blue : .white)
                .frame(width: 24, height: 24)
                .background(isSelected ? .white : Color.gray.opacity(0.5))
                .clipShape(Circle())
            
            configuration.title
        }
        .foregroundColor(isSelected ? .white : Color.black.opacity(0.7))
    }
}

// Custom Button Style
struct CategoryButtonStyle: ButtonStyle {
    let isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(isSelected ? Color.blue : Color.gray.opacity(0.2))
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
