//
//  ScrollSection.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import SwiftUI

struct ScrollSection: View {
    private let getProductService = GetProductService()
    @State private var plantList: [Plant]?
    var body: some View {
        VStack (alignment: .leading) {
            Text("Recommand list for you")
                .font(.headline)
                .foregroundColor(ProjColor.Gumleaf)
                .padding(.horizontal, 25.0)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(plantList ?? localPlantList, id: \.productID) { product in
                        NavigationLink {
                            ProductDetailView(plant: product)
                        } label: {
                            PlantCard(plant: product)
                        }
                        
                    }
                }
                .padding(50)
            }
        }
        .task {
            do {
                plantList = try await getProductService.getProduct()
            } catch GHError.invalidResponse {
                print("invalid response")
            } catch GHError.invalidData {
                print("invalid data")
            } catch GHError.invalidURL {
                print("invalid URL")
            } catch {
                print("unexpected error")
            }
        }
    }
}

struct ScrollSection_Previews: PreviewProvider {
    static var previews: some View {
        ScrollSection()
    }
}

enum GHError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
