//
//  ScrollSection.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import SwiftUI

struct ScrollSection: View {
    let cartManager: CartManager
    let viewModel = ScrollSectionViewModel(plantService: PlantService())
    
    var body: some View {
        VStack {
            sectionHeader
            
            if viewModel.isLoadingPlantList {
                loadingIndicator
            } else {
                plantScrollView
            }
        }
        .task { await viewModel.getPlantList() }
    }
    
    private var sectionHeader: some View {
        HStack {
            Text(viewModel.sectionHeaderString)
                .font(.headline)
                .foregroundColor(ProjColor.Gumleaf)
                .padding(.horizontal, 25.0)
            Spacer()
        }
    }
    
    private var plantScrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.plantList, id: \.productID) { product in
                    productView(product)
                }
                if viewModel.shouldShowEmptyListLabel {
                    emptyListLabel
                }
            }
            .padding(50)
        }
    }
    
    private var loadingIndicator: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
    
    private var emptyListLabel: some View {
        Text(viewModel.emptyListString)
            .font(.headline)
            .foregroundColor(ProjColor.PrimaryGreen)
    }
    
    private func productView(_ product: Plant) -> some View {
        NavigationLink {
            ProductDetailView(viewModel: ProductDetailViewModel(plant: product))
        } label: {
            PlantCard(viewModel: PlantCardViewModel(plant: product, cartManager: cartManager))
        }
    }
}

#Preview {
    ScrollSection(cartManager: CartManager())
}
