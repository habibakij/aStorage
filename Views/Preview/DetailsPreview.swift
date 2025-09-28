//
//  ItemDetailView_Previews.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: ProductListItemModel(
            title: "",
            description: "",
            imageName: "",
            discountPrice: "",
            price: "",
        ))
        .environmentObject(NavigationManager())
    }
}
