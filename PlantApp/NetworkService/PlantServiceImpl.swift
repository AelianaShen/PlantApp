//
//  PlantServiceImpl.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/19/24.
//

import Foundation

protocol PlantService {
    func getPlants() async -> [Plant]
    func getPlant(withId plantId: String) async -> Plant?
}

class PlantServiceImpl: PlantService {
    private let networkManager: NetworkManager
    private let getPlantsEndpoint: String
    
    init(networkManager: NetworkManager = NetworkManagerImpl(), userPreferences: UserPreferencesStore = UserPreferencesStoreImpl()) {
        self.networkManager = networkManager
        let queryParams = Self.queryParams(userPreferences)
        getPlantsEndpoint = "products?\(queryParams)"
        print(getPlantsEndpoint)
    }
    
    func getPlants() async -> [Plant] {
        await networkManager.getCollection(endpoint: getPlantsEndpoint)
    }
    
    func getPlant(withId plantId: String) async -> Plant? {
        await networkManager.get(endpoint: "product?productId=\(plantId)")
    }
    
    private static func queryParams(_ userPreferences: UserPreferencesStore) -> String {
        var queryItems: [String] = []
        queryItems.append("default_product=false")
        
        if let careLevel = userPreferences.careLevel?.rawValue {
            queryItems.append("care_level=\(careLevel)")
        }
        
        if let leafStyle = userPreferences.leafStyle?.rawValue {
            queryItems.append("leaf_style=\(leafStyle)")
        }
        
        if let lightLevel = userPreferences.lightLevel?.rawValue {
            queryItems.append("light_level=\(lightLevel)")
        }
        
        if let boxLevel = userPreferences.boxLevel?.rawValue, boxLevel > 0 {
            queryItems.append("box_level=\(boxLevel)")
        }
        
        if let petFriendly = userPreferences.petFriendly?.rawValue, petFriendly == "yes" {
            queryItems.append("pet_friendly=\(petFriendly)")
        }
        
        if let productiveOrDecorative = userPreferences.productiveOrDecorative?.rawValue {
            queryItems.append("productive_or_decorative=\(productiveOrDecorative)")
        }
        
        let getPlantsEndpoint = queryItems.joined(separator: "&")
        return getPlantsEndpoint
    }
}
