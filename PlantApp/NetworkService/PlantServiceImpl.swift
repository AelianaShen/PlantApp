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
        care_level = userPreferData.object(forKey: "care_level") as? String ?? nil
        leaf_style = userPreferData.object(forKey: "leaf_style") as? String ?? nil
        light_level = userPreferData.object(forKey: "light_level") as? String ?? nil
        pet_friendly = userPreferData.object(forKey: "pet_friendly") as? String ?? nil
        productive_or_decorative = userPreferData.object(forKey: "productive_or_decorative") as? String ?? nil
        // getPlantsEndpoint = "products?default_product=true&productive_or_decorative=decorative&leaf_style=dramatic&care_level=beginner"
        getPlantsEndpoint = "products?default_product=false\(care_level == nil ? "": "&care_level=\(care_level ?? "")")\(leaf_style == nil ? "": "&leaf_style=\(leaf_style ?? "")")\(light_level == nil ? "": "&light_level=\(light_level ?? "")")\(pet_friendly == nil ? "": "&pet_friendly=\(pet_friendly ?? "")")\(productive_or_decorative == nil ? "": "&productive_or_decorative=\(productive_or_decorative ?? "")")"
        print(getPlantsEndpoint)
    }
    
    func getPlants() async -> [Plant] {
        await networkManager.getCollection(endpoint: getPlantsEndpoint)
    }
    
    func getPlant(withId plantId: String) async -> Plant? {
        await networkManager.get(endpoint: "product?productId=\(plantId)")
    }
}
