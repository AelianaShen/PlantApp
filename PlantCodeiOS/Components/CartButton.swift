//
//  CartButton.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/18/23.
//

import SwiftUI

struct CartButton: View {
    var numOfProducts: Int
    var body: some View {
        ZStack(alignment: .topLeading){
            Image(systemName: "cart")
                .padding(.top, 5)
            
            if numOfProducts > 0 {
                Text("\(numOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(ProjColor.PrimaryGreen)
                    .cornerRadius(50)
                    .padding()
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numOfProducts: 1)
    }
}
