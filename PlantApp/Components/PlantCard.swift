//
//  PlantCard.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import SwiftUI

struct PlantCard: View {
    @EnvironmentObject var cartManager: CartManager
    var plant: Plant
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            HStack(alignment: .bottom) {
                VStack(alignment: .leading){
                    Text(plant.plantInfo.commonName)
                        .bold()
                    
                    Text("$\(plant.price)")
                        .font(.caption)
                }
                .padding([.leading, .bottom])
                .frame(width: 120)
                
                Button {
                    print("add it to cart!")
                    cartManager.addToCart(product: plant)
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
            
            if plant.imgURL != "" {
                AsyncImage(url: URL(string: plant.imgURL)){ image in
                    image.resizable()
                        .cornerRadius(20)
                        .scaledToFill()
                        .offset( x:0, y:-60)
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
        PlantCard(plant: plantList[0])
            .environmentObject(CartManager())
    }
}
