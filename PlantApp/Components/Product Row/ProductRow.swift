//
//  ProductRow.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/18/23.
//

import SwiftUI

struct ProductRow: View {
    let cartManager: CartManager
    @ObservedObject var viewModel: ProductRowViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            plantImage
            
            VStack(alignment: .leading, spacing: 10) {
                commonNameLabel
                priceLabel
            }
            
            Spacer()
            
            trashImage
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var plantImage: some View {
        AsyncImage(url: URL(string: viewModel.plant.imageURL)){ image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
        } placeholder: {
            ProgressView()
                .frame(width: 50)
        }
    }
    
    private var commonNameLabel: some View {
        Text(viewModel.plant.plantInfo.commonName)
            .bold()
    }
    
    private var priceLabel: some View {
        Text("$\(viewModel.plant.price)")
    }
    
    private var trashImage: some View {
        Image(systemName: "trash")
            .foregroundColor(ProjColor.PrimaryGreen)
            .onTapGesture {
                cartManager.removeFromCart(product: viewModel.plant)
            }
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(cartManager: CartManager(), viewModel: ProductRowViewModel(plant: Plant.localPlantList[1]))
    }
}
