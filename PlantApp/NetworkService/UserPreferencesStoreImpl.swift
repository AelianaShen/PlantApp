//
//  UserPreferencesStoreImpl.swift
//  PlantApp
//
//  Created by Aeliana Shen on 4/1/24.
//

import Foundation

protocol UserPreferencesStore {
    var careLevel: UserPreferences.CareLevel? { get set }
    var leafStyle: UserPreferences.LeafStyle? { get set }
    var lightLevel: UserPreferences.LightLevel? { get set }
    var boxLevel: UserPreferences.BoxLevel? { get set }
    var petFriendly: UserPreferences.PetFriendly? { get set }
    var colorScheme: UserPreferences.ColorScheme? { get set }
    var maintenanceLevel: UserPreferences.MaintenanceLevel? { get set }
    var productiveOrDecorative: UserPreferences.ProductiveOrDecorative? { get set }
}

class UserPreferencesStoreImpl: UserPreferencesStore {
    let userPreferData = UserDefaults.standard
    
    var careLevel: UserPreferences.CareLevel?
    var leafStyle: UserPreferences.LeafStyle?
    var lightLevel: UserPreferences.LightLevel?
    var boxLevel: UserPreferences.BoxLevel?
    var petFriendly: UserPreferences.PetFriendly?
    var colorScheme: UserPreferences.ColorScheme?
    var maintenanceLevel: UserPreferences.MaintenanceLevel?
    var productiveOrDecorative: UserPreferences.ProductiveOrDecorative?
    
    init() {
        let careLevelString = userPreferData.string(forKey: "careLevel")
        if let careLevelString {
            careLevel = UserPreferences.CareLevel(rawValue: careLevelString)
        }
        let leafStyleString = userPreferData.string(forKey: "leafStyle")
        if let leafStyleString {
            leafStyle = UserPreferences.LeafStyle(rawValue: leafStyleString)
        }
        let lightLevelInt = userPreferData.integer(forKey: "lightLevel")
        lightLevel = UserPreferences.LightLevel(rawValue: lightLevelInt)
        
        let boxLevelInt = userPreferData.integer(forKey: "boxLevel")
        boxLevel = UserPreferences.BoxLevel(rawValue: boxLevelInt)
        
        let petFriendlyString = userPreferData.string(forKey: "petFriendly")
        if let petFriendlyString {
            petFriendly = UserPreferences.PetFriendly(rawValue: petFriendlyString)
        }
        
        let colorSchemeString = userPreferData.string(forKey: "colorScheme")
        if let colorSchemeString {
            colorScheme = UserPreferences.ColorScheme(rawValue: colorSchemeString)
        }
        
        let maintenanceLevelString = userPreferData.string(forKey: "maintenanceLevel")
        if let maintenanceLevelString {
            maintenanceLevel = UserPreferences.MaintenanceLevel(rawValue: maintenanceLevelString)
        }
        
        let productiveOrDecorativeString = userPreferData.string(forKey: "productiveOrDecorative")
        if let productiveOrDecorativeString {
            productiveOrDecorative = UserPreferences.ProductiveOrDecorative(rawValue: productiveOrDecorativeString)
        }
    }
    
    func setCareLevel(option: String?) {
        userPreferData.set(option, forKey: "careLevel")
    }
    
    func setLeafStyle(option: String?) {
        userPreferData.set(option, forKey: "leafStyle")
    }
    
    func setLightLevel(option: Int?) {
        userPreferData.set(option, forKey: "lightLevel")
    }
    
    func setBoxLevel(option: Int?) {
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
