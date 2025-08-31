//
//  SplashView.swift
//  mvvm_practice_1
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    @ObservedObject private var authService = AuthenticationService.shared
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    // Header
                    Text("aStorage")
                        .font(.system(size: 30.0))
                        .fontWeight(.bold)
                    
                    // Search and filter
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("search product", text: $viewModel.searchText)
                                .textInputAutocapitalization(.never)
                        }
                        .padding(16)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 1)
                        
                        Image(systemName: "slider.horizontal.3")
                            .font(.system(size: 24.0))
                            .foregroundColor(.white)
                            .frame(width: 54, height: 54)
                            .background(Color.blue)
                            .clipShape(Circle())
                    }
                    .padding(.horizontal)
                    
                    // Category list with custom height
                    CategoryListView(categoryList: viewModel.categoryList).frame(height: 60)
                    
                    // Title
                    Text("Pick the best")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                        .padding(.top)
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible(), spacing: 10),
                                GridItem(.flexible(), spacing: 10)
                            ],
                            spacing: 28
                        ) {
                            ForEach(Array(viewModel.productList.enumerated()), id: \.offset) { index, product in
                                ProductItemView(product: product, index: index) {
                                    navigationManager.navigate(to: .itemDetail(product))
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.white.opacity(0.5))
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                Task {
                    await viewModel.loadItems()
                }
            }
//            .refreshable {
//                Task {
//                    await viewModel.loadItems()
//                }
//            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
