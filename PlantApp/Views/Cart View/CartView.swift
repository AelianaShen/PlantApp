//
//  CartView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/18/23.
//

import SwiftUI

struct CartView: View {
    let viewModel: CartViewModel

    var body: some View {
        ScrollView {
            if !viewModel.cartProducts.isEmpty {
                productsInCart
                
                HStack {
                    totalTitle
                    Spacer()
                    cartTotalLabel
                }
                .padding()
            } else {
                emptyMessage
            }
        }
        .navigationTitle(Text(viewModel.navigationTitleString))
        .padding(.top)
    }
    
    private var productsInCart: some View {
        ForEach(viewModel.cartProducts, id: \.productID) { plant in
            ProductRow(viewModel: ProductRowViewModel(plant: plant), onDelete: { viewModel.removeFromCart(product: plant) })
        }
    }
    
    private var totalTitle: some View {
        Text(viewModel.totalTitleString)
    }
    
    private var emptyMessage: some View {
        Text(viewModel.emptyString)
    }
    
    private var cartTotalLabel: some View {
        Text(viewModel.cartTotal)
            .bold()
    }
}

#Preview {
    CartView(viewModel: CartViewModel(cartManager: CartManager()))
}
