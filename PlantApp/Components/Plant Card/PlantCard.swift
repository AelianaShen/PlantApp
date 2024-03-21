//
//  PlantCard.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import SwiftUI

struct PlantCard: View {
    @EnvironmentObject var cartManager: CartManager
    @ObservedObject var viewModel: PlantCardViewModel
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            HStack(alignment: .bottom) {
                VStack(alignment: .leading){
                    Text(viewModel.plant.plantInfo.commonName)
                        .bold()
                    
                    Text("$\(viewModel.plant.price)")
                        .font(.caption)
                }
                .padding([.leading, .bottom])
                .frame(width: 120)
                
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
            .frame(width: 180, height: 220, alignment: .bottom)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            
            if viewModel.plant.imageURL != "" {
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
        .frame(width: 190, height: 250)
        .shadow(radius: 3)
    }
}

struct PlantCard_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PlantCardViewModel(plant: Plant.localPlantList[0])
        return PlantCard(viewModel: viewModel)
            .environmentObject(CartManager())
    }
}
