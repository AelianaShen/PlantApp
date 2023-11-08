//
//  PrimaryBtn.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/9/23.
//

import SwiftUI

struct PrimaryBtn: View {
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

struct PrimaryBtn_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryBtn(text: "Primary Button")
    }
}
