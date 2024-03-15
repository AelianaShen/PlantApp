//
//  ScrollSection.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import SwiftUI

struct ScrollSection: View {
    let viewModel = ScrollSectionViewModel()
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Recommended list for you")
                .font(.headline)
                .foregroundColor(ProjColor.Gumleaf)
                .padding(.horizontal, 25.0)
            
            if viewModel.isLoadingPlantList {
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            } else {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(viewModel.plantList ?? [], id: \.productID) { product in
                            NavigationLink {
                                ProductDetailView(plant: product)
                            } label: {
                                PlantCard(plant: product)
                            }
                        }
                        if (viewModel.plantList == nil && !viewModel.isLoadingPlantList) {
                            Text("The recommended list has no data.")
                                .font(.headline)
                                .foregroundColor(ProjColor.PrimaryGreen)
                        }
                    }
                    .padding(50)
                }
            }
        }
        .task {
            await viewModel.getPlantList()
        }
        .alert(isPresented: viewModel.showingErrorBinding, content: {
            Alert(title: Text("Load the local plant list?"), message: Text("Problems occur when loading the recommended list from the internet. Click OK to load the local plant list. \n\n Error: \(viewModel.errorMessage)"), primaryButton: .default(Text("Load")) {
                viewModel.plantList = Plant.localPlantList
            }, secondaryButton: .cancel())
        })
    }
}

struct ScrollSection_Previews: PreviewProvider {
    static var previews: some View {
        ScrollSection()
    }
}
