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
        Button {
            
        } label: {
            Text(text)
                .font(.title3)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 168, height: 50)
        .background(ProjColor.Yuma)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct SecondBtn_Previews: PreviewProvider {
    static var previews: some View {
        SecondBtn(text: "Second Button")
    }
}
