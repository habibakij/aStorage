//
//  BookingView.swift
//  aStorage
//
//  Created by USER on 2025-08-03.
//

import SwiftUI
import SwiftUI

struct BookingView: View {
    @StateObject private var viewModel = BookingViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                SectionHeader(title: "Whome")
                InfoCard(
                    items: [
                        ("Name:", "Akij Khan"),
                        ("Phone:", "01717722666"),
                        ("Email:", "akij.khan@gmail.com"),
                    ],
                    viewModel: viewModel,
                    isShowingPaymentSheet: false
                )
                
                SectionHeader(title: "Booking Details")
                InfoCard(
                    items: [
                        ("Title:", "Delax Suite mens watching"),
                        ("Quentity:", "20"),
                        ("Delivery date:", "2025-08-05"),
                        ("Type:", "Mens watch"),
                    ],
                    viewModel: viewModel,
                    isShowingPaymentSheet: false
                )
                
                SectionHeader(title: "Shipping & Payment")
                InfoCard(
                    items: [
                        ("Delivery at:", "Nikunja2, Dhaka, Suite 6"),
                        ("Payment type:", viewModel.selectedPaymentOption?.title ?? "Not selected"),
                    ],
                    viewModel: viewModel,
                    isShowingPaymentSheet: true
                )
                
                Spacer(minLength: 20)
            }
            .padding(.top, 16)
        }
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                navigationManager.navigate(to: .success)
            }) {
                Text("iBooking")
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
                Text("Booking Preview")
                    .font(.system(size: 28, weight: .bold))
            }
        }
    }
}

struct SectionHeader: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
}

struct InfoCard: View {
    let items: [(String, String)]
    @ObservedObject var viewModel: BookingViewModel
    let isShowingPaymentSheet: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            ForEach(0..<items.count, id: \.self) { index in
                infoRow(title: items[index].0, value: items[index].1)
                
                if index < items.count - 1 {
                    Divider()
                } else {
                    Spacer(minLength: 8)
                    if isShowingPaymentSheet == true {
                        CustomGridView(viewModel: viewModel)
                    }
                }
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func infoRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .fontWeight(.semibold)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}

struct CustomGridView: View {
    @ObservedObject var viewModel: BookingViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(viewModel.paymentOptionList) { option in
                VStack(alignment: .leading) {
                    Image(option.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(
                                    viewModel.selectedPaymentOption?.id
                                    == option.id
                                    ? Color.blue : Color.gray.opacity(0.2),
                                    lineWidth: 2
                                )
                        )
                }
                .onTapGesture {
                    viewModel.selectedPaymentOption = option
                }
            }
        }
        .padding()
    }
}
