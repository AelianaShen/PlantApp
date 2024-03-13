//
//  GetProductService.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/12/24.
//

import Foundation

class GetProductService {
    private let endpoint = "https://kkq4d2a80b.execute-api.us-west-2.amazonaws.com/prod/defproducts"
    // private let endpoint = "https://kkq4d2a80b.execute-api.us-west-2.amazonaws.com/prod/product?productId=100002"
    
    func getProduct() async throws -> [Plant]? {
        
        guard let url = URL(string: endpoint) else { throw URLError(.badURL) }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let decoder = JSONDecoder()
            let plantsResponse = try decoder.decode(ProductCollectionResponse.self, from: data)
            return plantsResponse.plants
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
    }
}
