//
//  CartButton.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/18/23.
//

import SwiftUI

struct CartButton: View {
    let viewModel: CartButtonViewModel
    var body: some View {
        ZStack(alignment: .topLeading){
            cartImage
            if viewModel.numOfProducts > 0 {
                numOfProductsText
            }
        }
    }
    
    private var cartImage: some View {
        Image(systemName: "cart")
            .padding(.top, 5)
    }
    
    private var numOfProductsText: some View {
        Text("\(viewModel.numOfProducts)")
            .font(.caption2).bold()
            .foregroundColor(.white)
            .frame(width: 15, height: 15)
            .background(ProjColor.PrimaryGreen)
            .cornerRadius(50)
            .padding()
    }
}

#Preview {
    CartButton(viewModel: CartButtonViewModel(numOfProducts: 1))
}
