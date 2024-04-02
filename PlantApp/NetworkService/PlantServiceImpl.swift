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
    
    init(userPreferences: UserPreferences = UserPreferencesImpl()) {
        let care_level = userPreferences.care_level
        let leaf_style = userPreferences.leaf_style
        let light_level = userPreferences.light_level
        let pet_friendly = userPreferences.pet_friendly
        let productive_or_decorative = userPreferences.productive_or_decorative
        
        getPlantsEndpoint = "products?default_product=false\(care_level == nil ? "": "&care_level=\(care_level ?? "")")\(leaf_style == nil ? "": "&leaf_style=\(leaf_style ?? "")")\(light_level == nil ? "": "&light_level=\(light_level ?? "")")\(productive_or_decorative == nil ? "": "&productive_or_decorative=\(productive_or_decorative ?? "")")"
        print(getPlantsEndpoint)
    }
    
    func getPlants() async -> [Plant] {
        await networkManager.getCollection(endpoint: getPlantsEndpoint)
    }
    
    func getPlant(withId plantId: String) async -> Plant? {
        await networkManager.get(endpoint: "product?productId=\(plantId)")
    }
}
