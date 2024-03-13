//
//  ProductDetailView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import SwiftUI

struct ProductDetailView: View {
    var plant: Plant
    var body: some View {
        ZStack {
            Canvas { context, size in
                context.draw(Image(systemName: "circle.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            }
            .frame(width: 500, height: 500, alignment: .center)
            .foregroundStyle(.linearGradient(
                colors: [.white, ProjColor.SnowDrift],
                startPoint: .topTrailing,
                endPoint: .bottomLeading))
            .position( x: 200, y: 120)
            
            VStack {
                
                if plant.imgURL != "" {
                    AsyncImage(url: URL(string: plant.imgURL)){ image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 350, alignment: .top)
                    } placeholder: {
                        ProgressView()
                            .frame(maxHeight: 350, alignment: .top)
                    }
                }
                
                VStack {
                    ScrollView {
                        Text(plant.plantInfo.commonName)
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        
                        Text(plant.plantInfo.scientificName)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            
                        
                        Text(plant.plantInfo.description)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .padding()
                        
                        Text(plant.plantInfo.careTips)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .padding()
                        
                        Text(plant.plantInfo.benefits)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                            .padding()
                    }
                    .frame(height: 280)
                    
                }
                .frame(maxWidth: .infinity,
                       maxHeight: 300, alignment: .top)
               
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            
            VStack {
                HStack {
                    NavigationLink {
                        ARPlacePlantView(plant: plant.modelURL)
                    } label: {
                        SecondBtn(text: "AR simulate")
                    }
                    SecondBtn(text: "Add to cart")
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding()
            
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(plant: plantList[0])
    }
}
