//
//  CartView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/18/23.
//

import SwiftUI

struct CartView: View {
    let cartManager: CartManager
    @ObservedObject var viewModel: CartViewModel
    var body: some View {
        ScrollView {
            if viewModel.cartManager.products.count > 0 {
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
        ForEach(viewModel.cartManager.products, id: \.productID) {
            plant in
            ProductRow(cartManager: cartManager, viewModel: ProductRowViewModel(plant: plant))
        }
    }
    
    private var totalTitle: some View {
        Text(viewModel.totalTitleString)
    }
    
    private var emptyMessage: some View {
        Text(viewModel.emptyString)
    }
    
    private var cartTotalLabel: some View {
        Text("$\(viewModel.cartManager.total).00")
            .bold()
    }
}

#Preview {
    CartView(cartManager: CartManager(), viewModel: CartViewModel(cartManager: CartManager()))
}
