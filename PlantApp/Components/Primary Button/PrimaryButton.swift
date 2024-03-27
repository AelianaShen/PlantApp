//
//  PrimaryButton.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/9/23.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    
    var body: some View {
        primaryButtonLabel
    }
    
    private var primaryButtonLabel: some View {
        Text(text)
            .font(.title3)
            .bold()
            .frame(width: 280, height: 50)
            .background(ProjColor.PrimaryGreen)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

#Preview {
    PrimaryButton(text: "Primary Button")
}
