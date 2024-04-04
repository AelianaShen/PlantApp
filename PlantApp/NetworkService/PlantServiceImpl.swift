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
    private let networkManager = NetworkManager()
    private var getPlantsEndpoint: String
    
    init(userPreferences: UserPreferencesStore = UserPreferencesStoreImpl()) {
        let careLevel = userPreferences.careLevel
        let leafStyle = userPreferences.leafStyle
        let lightLevel = userPreferences.lightLevel
        let boxLevel = userPreferences.boxLevel
        let petFriendly = userPreferences.petFriendly
        let productiveOrDecorative = userPreferences.productiveOrDecorative
        
        getPlantsEndpoint = "products?default_product=false\(careLevel == nil ? "": "&care_level=\(careLevel ?? "")")\(leafStyle == nil ? "": "&leaf_style=\(leafStyle ?? "")")\(lightLevel == nil ? "": "&light_level=\(lightLevel ?? "")")\(boxLevel == nil ? "": "&box_level=\(boxLevel ?? "")")\(petFriendly == "yes" ? "&pet_friendly=true": "")\(productiveOrDecorative == nil ? "": "&productive_or_decorative=\(productiveOrDecorative ?? "")")"
        print(getPlantsEndpoint)
    }
    
    func getPlants() async -> [Plant] {
        await networkManager.getCollection(endpoint: getPlantsEndpoint)
    }
    
    func getPlant(withId plantId: String) async -> Plant? {
        await networkManager.get(endpoint: "product?productId=\(plantId)")
    }
}
