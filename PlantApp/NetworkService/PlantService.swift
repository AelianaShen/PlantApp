//
//  PlantService.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/19/24.
//

import Foundation

protocol PlantServiceProtocol {
    func getPlants() async throws -> [Plant]
    func getPlant(withId plantId: String) async throws -> Plant
}

class PlantService: PlantServiceProtocol {
    private let networkManager = NetworkManager()
    
    func getPlants() async throws -> [Plant] {
        try await networkManager.getCollection(endpoint: "defproducts")
    }
    
    func getPlant(withId plantId: String) async throws -> Plant {
        try await networkManager.get(endpoint: "product?productId=\(plantId)")
    }
}
