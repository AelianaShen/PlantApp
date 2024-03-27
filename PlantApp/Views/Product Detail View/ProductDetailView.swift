//
//  ProductDetailView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var viewModel: ProductDetailViewModel
    
    var body: some View {
        ZStack {
            backgroundCanvasAndStyling
            
            VStack {
                if viewModel.plant.imageURL != "" {
                    productImage
                }
                
                VStack {
                    productInformation
                }
                .frame(maxWidth: .infinity, maxHeight: 300, alignment: .top)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            
            VStack {
                HStack {
                    arSimulateButton
                    addToCartButton
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding()
        }
    }
    
    private var backgroundCanvasAndStyling: some View {
        Canvas { context, size in
            context.draw(Image(systemName: "circle.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        .frame(width: 500, height: 500, alignment: .center)
        .foregroundStyle(.linearGradient(
            colors: [.white, ProjColor.SnowDrift],
            startPoint: .topTrailing,
            endPoint: .bottomLeading))
        .position( x: 200, y: 120)
    }
    
    private var productImage: some View {
        AsyncImage(url: URL(string: viewModel.plant.imageURL)){ image in
            image.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 350, alignment: .top)
        } placeholder: {
            ProgressView()
                .frame(maxHeight: 350, alignment: .top)
        }
    }
    
    private var productInformation: some View {
        ScrollView {
            Text(viewModel.plant.plantInfo.commonName)
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text(viewModel.plant.plantInfo.scientificName)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
                
            
            Text(viewModel.plant.plantInfo.description)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
                .padding()
            
            Text(viewModel.plant.plantInfo.careTips)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
                .padding()
            
            Text(viewModel.plant.plantInfo.benefits)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
                .padding()
        }
        .frame(height: 280)
    }
    
    private var arSimulateButton: some View {
        NavigationLink {
            ARPlacePlantView(viewModel: ARPlacePlantViewModel(plant: viewModel.plant.modelURL))
        } label: {
            SecondButton(text: "AR simulate")
        }
    }
    
    private var addToCartButton: some View {
        SecondButton(text: "Add to cart")
            .onTapGesture {
                viewModel.addToCart()
            }
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(plant: Plant.localPlantList[0]))
}
