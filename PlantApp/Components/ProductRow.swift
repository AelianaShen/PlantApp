//
//  ProductRow.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/18/23.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var plant: Plant
    
    var body: some View {
        HStack(spacing: 20) {
            Image(plant.imgURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(plant.plantInfo.commonName)
                    .bold()
                
                Text("$\(plant.price)")
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(ProjColor.PrimaryGreen)
                .onTapGesture {
                    cartManager.removeFromCart(product: plant)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(plant: localPlantList[1])
            .environmentObject(CartManager())
    }
}
