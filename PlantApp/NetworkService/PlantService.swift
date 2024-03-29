//
//  PlantService.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/19/24.
//

import Foundation

protocol PlantServiceProtocol {
    func getPlants() async -> [Plant]
    func getPlant(withId plantId: String) async -> Plant?
}

class PlantService: PlantServiceProtocol {
    private let networkManager = NetworkManager()
    
    func getPlants() async -> [Plant] {
        await networkManager.getCollection(endpoint: "defproducts")
    }
    
    func getPlant(withId plantId: String) async -> Plant? {
        await networkManager.get(endpoint: "product?productId=\(plantId)")
    }
}
