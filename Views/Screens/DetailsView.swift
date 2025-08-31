//
//  SplashView.swift
//  mvvm_practice_1
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

struct ItemDetailView: View {
    @StateObject private var viewModel: ItemDetailViewModel
    @EnvironmentObject var navigationManager: NavigationManager
    
    init(item: ProductListItemModel) {
        self._viewModel = StateObject(wrappedValue: ItemDetailViewModel(item: item))
    }
    
    var body: some View {
        ScrollView{
            ZStack{
                VStack(spacing: 24) {
                    
                    Image(viewModel.item.imageName)
                    //Image("image_1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .cornerRadius(12)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(viewModel.item.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Divider()
                        
                        Text(viewModel.item.title)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(viewModel.item.description).font(.body).lineSpacing(4)
//                        Text(
//                            "A short description is a concise summary, usually one or two sentences, that provides a quick overview of a topic, product, or concept. It's designed to be easily understood and to give the reader the most important information without unnecessary details. Think of it as a brief elevator pitch or a quick way to grasp the essence of something."
//                        )
//                        .font(.body)
//                        .lineSpacing(4)
//                        .lineLimit(4)
                    }
                    
                    Text("Facelities")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(viewModel.facilities) { facility in
                        HStack {
                            Button(action: {
                                viewModel.toggleFacility(facility)
                            }) {
                                Image(systemName: facility.isSelected ? "checkmark.square" : "square")
                                    .foregroundColor(.blue)
                            }
                            Text(facility.name)
                                .font(.body)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    Text("Your preferance")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(viewModel.facilityOptions) { option in
                        HStack {
                            Button(action: {
                                viewModel.selectFacility(option)
                            }) {
                                Image(systemName: viewModel.selectedFacility == option ? "largecircle.fill.circle" : "circle")
                                    .foregroundColor(.blue)
                            }
                            Text(option.name)
                                .font(.body)
                            Spacer()
                        }
                        .padding(.horizontal)
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
                            .padding(.horizontal)
                    }
                }
                .padding(.horizontal, 16)
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                viewModel.goToBooking(using: navigationManager)
            }) {
                Text("Continue")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.top, 12)
            .background(.ultraThinMaterial)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Details View")
                    .font(.system(size: 28, weight: .bold))
            }
        }
    }
}
