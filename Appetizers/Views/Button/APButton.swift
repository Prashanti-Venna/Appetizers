//
//  APButton.swift
//  Appetizers
//
//  Created by Prashanti Venna on 14/08/2024.
//

import SwiftUI

struct APButton: View {
    var title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "Test Button")
}
