//
//  ScrollSection.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import SwiftUI

struct ScrollSection: View {
    private let plantService = PlantService()
    @State private var plantList: [Plant]?
    @State private var showingError = false
    @State private var errorMessage = ""
    
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
                plantList = try await plantService.getPlants()
                // print(try await plantService.getPlant(withId: "100002"))
            } catch URLError.badURL {
                showingError = true
                errorMessage = "bad URL"
            } catch URLError.badServerResponse {
                showingError = true
                errorMessage = "bad server response"
            } catch URLError.cannotDecodeContentData {
                showingError = true
                errorMessage = "can not decode content data"
            } catch {
                showingError = true
                errorMessage = "unexpected error"
            }
        }
        .alert(isPresented: $showingError, content: {
            Alert(title: Text("Error: " + errorMessage))
        })
    }
}

struct ScrollSection_Previews: PreviewProvider {
    static var previews: some View {
        ScrollSection()
    }
}
