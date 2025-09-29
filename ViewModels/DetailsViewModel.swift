//
//  ItemDetailViewModel.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-22.
//

import SwiftUI

class ItemDetailViewModel: ObservableObject {
    @Published var cartCount: Int = 0
    @Published var item: ProductListItemModel
    
    init(item: ProductListItemModel) {self.item = item}
    
    @Published var facilities: [Facility] = [
        Facility(name: "WiFi", isSelected: false),
        Facility(name: "Parking", isSelected: false),
        Facility(name: "Pool", isSelected: false),
        Facility(name: "Gym", isSelected: false),
        Facility(name: "AC", isSelected: false),
        Facility(name: "Salon", isSelected: false),
        Facility(name: "Car", isSelected: false),
        Facility(name: "Racing", isSelected: false),
        Facility(name: "Food", isSelected: false)
    ]
    @Published var facilityOptions: [FacilityOption] = [
        FacilityOption(name: "Standard"),
        FacilityOption(name: "Premium"),
        FacilityOption(name: "Luxury")
    ]
    @Published var selectionList: [FacilityOption] = [
        FacilityOption(name: "Double Standard"),
        FacilityOption(name: "Single Product"),
        FacilityOption(name: "Car Detection")
    ]
    
    func toggleFacility(_ facility: Facility) {
        if let index = facilities.firstIndex(where: { $0.id == facility.id }) {
            facilities[index].isSelected.toggle()
        }
    }
    
    @Published var selectedFacility: FacilityOption?
    
    func selectFacility(_ option: FacilityOption) {
        selectedFacility = option
    }
    
    @Published var selectedNeed: FacilityOption?
    
    
    func iBooking() {
        let selectedFacilities = facilities.filter { $0.isSelected }
        print("Selected_facilities: \(selectedFacilities.map { $0.name })")
        print("Selected_option: \(selectedFacility.map(\.name) ?? "None")")
    }
    
    func goToBooking(using navigationManager: NavigationManager) {
        navigationManager.navigate(to: .bookingView)
    }
}
