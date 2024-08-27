//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Prashanti Venna on 14/08/2024.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    @Binding var isShowingDetailView: Bool
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40) {
                    NutritionInfoView(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfoView(title: "Carbs", value: "\(appetizer.carbs)")
                    NutritionInfoView(title: "Proteins", value: "\(appetizer.protein)")
                }
            }
            Spacer()
            Button {
                order.add(appetizer)
                isShowingDetailView = false
            } label: {
               APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetailView = false
            } label: {
                XDismissButton()
            }
        }
        
    }
}

#Preview {
    AppetizerDetailView(isShowingDetailView: .constant(false), appetizer: MockData.sampleAppetizer)
}

struct NutritionInfoView: View {
    var title: String
    var value: String
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text(value)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
