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
        
        ZStack{
            VStack(spacing: 24) {
                
                Text("Details View")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                
                //Image(viewModel.item.imageName)
                Image("image_1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("aLack View Inc.")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Divider()
                    
                    Text("Description")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    //Text(viewModel.item.description).font(.body).lineSpacing(4)
                    Text(
                        "A short description is a concise summary, usually one or two sentences, that provides a quick overview of a topic, product, or concept. It's designed to be easily understood and to give the reader the most important information without unnecessary details. Think of it as a brief elevator pitch or a quick way to grasp the essence of something."
                    )
                    .font(.body)
                    .lineSpacing(4)
                    .lineLimit(4)
                    
                }
                
                Button(action: {
                    viewModel.performAction()
                }) {
                    Text("Perform Action")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .background(Color.secondary.opacity(0.2))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
