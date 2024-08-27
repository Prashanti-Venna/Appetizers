//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Prashanti Venna on 12/08/2024.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
   
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.isShowingDetailView = true
                            viewModel.selectedAppetizer = appetizer
                        }
                }
                .navigationTitle("Appetizers")
                .listStyle(PlainListStyle())
                .disabled(viewModel.isShowingDetailView)
            }
            .onAppear {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            if viewModel.isShowingDetailView {
                AppetizerDetailView(isShowingDetailView: $viewModel.isShowingDetailView, appetizer: viewModel.selectedAppetizer!)
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }.alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
