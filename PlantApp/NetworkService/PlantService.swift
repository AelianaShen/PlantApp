//
//  PlantService.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/12/24.
//

import Foundation

protocol PlantServiceProtocol {
    func getPlants() async throws -> [Plant]
}

class PlantService: PlantServiceProtocol {
    private let endpoint = "https://p6ib01la4m.execute-api.us-west-2.amazonaws.com/prod/defproducts"
    private let endpoint_single = "https://p6ib01la4m.execute-api.us-west-2.amazonaws.com/prod/product?productId="
    
    func getPlants() async throws -> [Plant] {
        guard let url = URL(string: endpoint) else { throw URLError(.badURL) }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let decoder = JSONDecoder()
            let plantsResponse = try decoder.decode(PlantCollectionResponse.self, from: data)
            return plantsResponse.plants
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
    }
    
    func getPlant(withId plantId: String) async throws -> Plant? {
        guard let url = URL(string: endpoint_single + plantId) else { throw URLError(.badURL) }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let decoder = JSONDecoder()
            let plantResponse = try decoder.decode(PlantResponse.self, from: data)
            return plantResponse.plant
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
    }
}
