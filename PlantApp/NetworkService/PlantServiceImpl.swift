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
    
    private let userPreferData = UserDefaults.standard
    private let care_level: String?
    private let leaf_style: String?
    private let light_level: String?
    private let pet_friendly: String?
    private let productive_or_decorative: String?
    private let getPlantsEndpoint: String
    
    init() {
        care_level = userPreferData.string(forKey: "care_level")
        leaf_style = userPreferData.string(forKey: "leaf_style")
        light_level = userPreferData.string(forKey: "light_level")
        pet_friendly = userPreferData.string(forKey: "pet_friendly")
        productive_or_decorative = userPreferData.string(forKey: "productive_or_decorative")
        // getPlantsEndpoint = "products?default_product=true&productive_or_decorative=decorative&leaf_style=dramatic&care_level=beginner"
        getPlantsEndpoint = "products?default_product=false\(care_level == nil ? "": "&care_level=\(care_level ?? "")")\(leaf_style == nil ? "": "&leaf_style=\(leaf_style ?? "")")\(light_level == nil ? "": "&light_level=\(light_level ?? "")")\(pet_friendly == nil ? "": "&pet_friendly=\(pet_friendly ?? "")")\(productive_or_decorative == nil ? "": "&productive_or_decorative=\(productive_or_decorative ?? "")")"
    }
    
    func getPlants() async -> [Plant] {
        await networkManager.getCollection(endpoint: getPlantsEndpoint)
    }
    
    func getPlant(withId plantId: String) async -> Plant? {
        await networkManager.get(endpoint: "product?productId=\(plantId)")
    }
}
