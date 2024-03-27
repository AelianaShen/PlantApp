//
//  PlantCard.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import SwiftUI

struct PlantCard: View {
    let cartManager: CartManager
    @ObservedObject var viewModel: PlantCardViewModel
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            HStack(alignment: .bottom) {
                VStack(alignment: .leading){
                    commonNameLabel
                    priceLabel
                }
                .padding([.leading, .bottom])
                .frame(width: 120)
                
                addToCartButton
                
            }
            .frame(width: 180, height: 220, alignment: .bottom)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            
            if viewModel.plant.imageURL != "" {
                plantImage
            }
        }
        .frame(width: 190, height: 250)
        .shadow(radius: 3)
    }
    
    private var commonNameLabel: some View {
        Text(viewModel.plant.plantInfo.commonName)
            .bold()
    }
    
    private var priceLabel: some View {
        Text("$\(viewModel.plant.price)")
            .font(.caption)
    }
    
    private var addToCartButton: some View {
        Button {
            print("add it to cart!")
            viewModel.addToCart(cartManager: cartManager)
        } label: {
            Image(systemName: "cart")
                .padding(10)
                .foregroundColor(ProjColor.accentColor)
                .background(ProjColor.SnowDrift)
                .cornerRadius(50)
        }.padding([.bottom, .trailing])
    }
    
    private var plantImage: some View {
        AsyncImage(url: URL(string: viewModel.plant.imageURL)){ image in
            image.resizable()
                .cornerRadius(20)
                .scaledToFill()
                .offset( x:0, y:-90)
                .frame(width: 120, height: 180)
        } placeholder: {
            ProgressView()
                .frame(width: 120, height: 180)
        }
    }
}

#Preview {
    PlantCard(cartManager: CartManager(), viewModel: PlantCardViewModel(plant: Plant.localPlantList[0]))
}
