//
//  ScrollSection.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import SwiftUI

struct ScrollSection: View {
    @State private var products: ResponseJson?
    @State var productsList: [Plant]
    var body: some View {
        VStack (alignment: .leading) {
            Text("Recommand list for you")
                .font(.headline)
                .foregroundColor(ProjColor.Gumleaf)
                .padding(.horizontal, 25.0)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack {
                    ForEach(productsList, id: \.id) { product in
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
                products = try await getProduct()
                productsList = convertJSON(resJson: products!)
                print(productsList)
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
    
    func getProduct() async throws -> ResponseJson {
        // let endpoint = "https://kkq4d2a80b.execute-api.us-west-2.amazonaws.com/prod/product?productId=100002"
        let endpoint = "https://kkq4d2a80b.execute-api.us-west-2.amazonaws.com/prod/defproducts"
        guard let url = URL(string: endpoint) else { throw GHError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(ResponseJson.self, from: data)
        } catch {
            throw GHError.invalidData
        }
    }
}

struct ScrollSection_Previews: PreviewProvider {
    static var previews: some View {
        ScrollSection(productsList: plantList)
    }
}

enum GHError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
