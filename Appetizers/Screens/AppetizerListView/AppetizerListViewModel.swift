//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Prashanti Venna on 14/08/2024.
//

import Foundation
import SwiftUI

final  class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { (result) in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    self.setAlerItem(for: error)
                }
            }
        }
    }
    
    func setAlerItem(for error: APError) {
        switch error {
        case .invalidData:
            self.alertItem = AlertContext.invalidData
        case .invalidURL:
            self.alertItem = AlertContext.invalidURL
        case .invalidResponse:
            self.alertItem = AlertContext.invalidResponse
        case .unableToComplete:
            self.alertItem = AlertContext.unableToComplete
        }
    }
}


