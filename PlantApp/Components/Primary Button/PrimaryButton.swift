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
        Text(text)
            .font(.title3)
            .bold()
            .frame(width: 280, height: 50)
            .background(ProjColor.PrimaryGreen)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Primary Button")
    }
}
