//
//  UserPreferencesStoreImpl.swift
//  PlantApp
//
//  Created by Aeliana Shen on 4/1/24.
//

import Foundation

protocol UserPreferencesStore {
    var careLevel: String? { get set }
    var leafStyle: String? { get set }
    var lightLevel: String? { get set }
    var boxLevel: String? { get set }
    var petFriendly: String? { get set }
    var colorScheme: String? { get set }
    var maintenanceLevel: String? { get set }
    var productiveOrDecorative: String? { get set }
}

class UserPreferencesStoreImpl: UserPreferencesStore {
    let userPreferData = UserDefaults.standard
    
    var careLevel: String?
    var leafStyle: String?
    var lightLevel: String?
    var boxLevel: String?
    var petFriendly: String?
    var colorScheme: String?
    var maintenanceLevel: String?
    var productiveOrDecorative: String?
    
    init() {
        careLevel = userPreferData.string(forKey: "careLevel")
        leafStyle = userPreferData.string(forKey: "leafStyle")
        lightLevel = userPreferData.string(forKey: "lightLevel")
        boxLevel = userPreferData.string(forKey: "boxLevel")
        petFriendly = userPreferData.string(forKey: "petFriendly")
        colorScheme = userPreferData.string(forKey: "colorScheme")
        maintenanceLevel = userPreferData.string(forKey: "maintenanceLevel")
        productiveOrDecorative = userPreferData.string(forKey: "productiveOrDecorative")
    }
    
    func setCareLevel(option: String?) {
        userPreferData.set(option, forKey: "careLevel")
    }
    
    func setLeafStyle(option: String?) {
        userPreferData.set(option, forKey: "leafStyle")
    }
    
    func setLightLevel(option: String?) {
        userPreferData.set(option, forKey: "lightLevel")
    }
    
    func setBoxLevel(option: String?) {
        userPreferData.set(option, forKey: "boxLevel")
    }
    
    func setPetFriendly(option: String?) {
        userPreferData.set(option, forKey: "petFriendly")
    }
    
    func setColorScheme(option: String?) {
        userPreferData.set(option, forKey: "colorScheme")
    }
    
    func setMaintenanceLevel(option: String?) {
        userPreferData.set(option, forKey: "maintenanceLevel")
    }
    
    func setProductiveOrDecorative(option: String?) {
        userPreferData.set(option, forKey: "productiveOrDecorative")
    }
}
