//
//  ItemDetailView.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel: ItemDetailViewModel
    @EnvironmentObject var navigationManager: NavigationManager
    
    init(item: ProductListItemModel) {
        self._viewModel = StateObject(wrappedValue: ItemDetailViewModel(item: item))
    }
    
    var body: some View {
        ScrollView{
            ZStack{
                VStack(spacing: 24) {
                    
                    Image(safe: viewModel.item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .cornerRadius(12)
                        .padding(.top, 24)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(viewModel.item.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Divider()
                        
                        Text("Description")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(viewModel.item.description).font(.body).lineSpacing(4)
                    }
                    
                    Text("Facelities")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(viewModel.facilities) { facility in
                        Button(action: {
                            viewModel.toggleFacility(facility)
                        }) {
                            HStack{
                                Image(systemName: facility.isSelected ? "checkmark.square.fill" : "square")
                                    .foregroundColor(.blue)
                                Text(facility.name)
                                    .font(.body)
                                Spacer()
                            }
                        }
                    }
                    Text("Your preferance")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(viewModel.facilityOptions) { option in
                        Button(action: {
                            viewModel.selectFacility(option)
                        }) {
                            HStack{
                                Image(systemName: viewModel.selectedFacility == option ? "largecircle.fill.circle" : "circle")
                                    .foregroundColor(.blue)
                                Text(option.name)
                                    .font(.body)
                                Spacer()
                            }
                        }
                    }
                    Text("Need to")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(viewModel.facilityOptions) { item in
                        Text(item.name)
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack{
                Button(action: {
                    
                }) {
                    Text("Buy now")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.all, 12)
                        .background(Color.cyan)
                        .cornerRadius(8)
                        .padding(.leading, 12)
                }
                
                Button(action: {
                    viewModel.cartCount += 1
                }) {
                    Text("Add to cart")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.all, 12)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding(.trailing, 12)
                }
            }
            .padding(.top, 12)
            .background(.white)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            ToolbarItem(placement: .principal) {
                Text(viewModel.item.title)
                    .font(.system(size: 20, weight: .bold))
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                ZStack(alignment: .topTrailing) {
                    Button(action: {
                        if viewModel.cartCount == 0 {
                            viewModel.showEmptyCartAlert = true
                        } else {
                            navigationManager.navigate(to: .cartView)
                        }
                    }) {
                        Image(systemName: "cart")
                            .font(.title2)
                    }
                    .alert(isPresented: $viewModel.showEmptyCartAlert) {
                        Alert(
                            title: Text("Cart is Empty"),
                            message: Text("You have no items in your cart."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    
                    if viewModel.cartCount > 0 {
                        Text("\(viewModel.cartCount)")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: 10, y: -10)
                    }
                }
            }

            
        }
    }
}
