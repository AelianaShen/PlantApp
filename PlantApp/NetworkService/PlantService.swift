//
//  PlantService.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/12/24.
//

import Foundation

protocol PlantServiceProtocol {
    func getPlants() async throws -> [Plant]
    func getPlant(withId plantId: String) async throws -> Plant
}

class NetworkManager {
    private let baseURL = "https://p6ib01la4m.execute-api.us-west-2.amazonaws.com/prod/"
    
    func getCollection<Model: Codable>(endpoint: String) async throws -> [Model] {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(CollectionResponse<Model>.self, from: data)
            return response.items
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
    }
    
    func get<Model: Codable>(endpoint: String) async throws -> Model {
        guard let url = URL(string: "\(baseURL)\(endpoint)") else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(Response<Model>.self, from: data)
            return response.item
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
    }
}

class PlantService: PlantServiceProtocol {
    private let networkManager = NetworkManager()
    
    func getPlants() async throws -> [Plant] {
        try await networkManager.getCollection(endpoint: "defproducts")
    }
    
    func getPlant(withId plantId: String) async throws -> Plant {
        try await networkManager.get(endpoint: "products?productId\(plantId)")
    }
}
