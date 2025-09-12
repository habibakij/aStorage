//
//  ItemDetailView_Previews.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: ProductListItemModel(
            title: "",
            description: "",
            imageName: "",
            price: "",
        ))
        .environmentObject(NavigationManager())
    }
}
