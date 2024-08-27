//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by Prashanti Venna on 15/08/2024.
//

import SwiftUI

struct EmptyStateView: View {
    
    var imageName: String
    var message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyStateView(imageName: "empty-order", message: "Default")
}
