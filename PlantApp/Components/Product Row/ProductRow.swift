//
//  ProductRow.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/18/23.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    @ObservedObject var viewModel: ProductRowViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            Image(viewModel.plant.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.plant.plantInfo.commonName)
                    .bold()
                
                Text("$\(viewModel.plant.price)")
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(ProjColor.PrimaryGreen)
                .onTapGesture {
                    cartManager.removeFromCart(product: viewModel.plant)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(viewModel: ProductRowViewModel(plant: Plant.localPlantList[1]))
            .environmentObject(CartManager())
    }
}
