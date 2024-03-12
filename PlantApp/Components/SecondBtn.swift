//
//  SecondBtn.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/15/23.
//

import SwiftUI

struct SecondBtn: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.title3)
            .bold()
            .frame(width: 168, height: 50)
            .background(ProjColor.Yuma)
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(radius: 3)
    }
}

struct SecondBtn_Previews: PreviewProvider {
    static var previews: some View {
        SecondBtn(text: "Second Button")
    }
}
