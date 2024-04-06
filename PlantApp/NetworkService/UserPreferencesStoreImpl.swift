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
    private let userPreferData = UserDefaults.standard
    
    var careLevel: UserPreferences.CareLevel? {
        get {
            let careLevelString = userPreferData.string(forKey: "careLevel")
            if let careLevelString {
                return UserPreferences.CareLevel(rawValue: careLevelString)
            }
            return nil
        }
        set {
            userPreferData.set(newValue?.rawValue, forKey: "careLevel")
        }
    }
    
    var leafStyle: UserPreferences.LeafStyle? {
        get {
            let leafStyleString = userPreferData.string(forKey: "leafStyle")
            if let leafStyleString {
                return UserPreferences.LeafStyle(rawValue: leafStyleString)
            }
            return nil
        }
        set {
            userPreferData.set(newValue?.rawValue, forKey: "leafStyle")
        }
    }
    
    var lightLevel: UserPreferences.LightLevel? {
        get {
            let lightLevelInt = userPreferData.integer(forKey: "lightLevel")
            return UserPreferences.LightLevel(rawValue: lightLevelInt)
        }
        set {
            userPreferData.set(newValue?.rawValue, forKey: "lightLevel")
        }
    }
    
    var boxLevel: UserPreferences.BoxLevel? {
        get {
            let boxLevelInt = userPreferData.integer(forKey: "boxLevel")
            return UserPreferences.BoxLevel(rawValue: boxLevelInt)
        }
        set {
            userPreferData.set(newValue?.rawValue, forKey: "boxLevel")
        }
    }
    
    var petFriendly: UserPreferences.PetFriendly? {
        get {
            let petFriendlyString = userPreferData.string(forKey: "petFriendly")
            if let petFriendlyString {
                return UserPreferences.PetFriendly(rawValue: petFriendlyString)
            }
            return nil
        }
        set {
            userPreferData.set(newValue?.rawValue, forKey: "petFriendly")
        }
    }
    
    var colorScheme: UserPreferences.ColorScheme? {
        get {
            let colorSchemeString = userPreferData.string(forKey: "colorScheme")
            if let colorSchemeString {
                return UserPreferences.ColorScheme(rawValue: colorSchemeString)
            }
            return nil
        }
        set {
            userPreferData.set(newValue?.rawValue, forKey: "colorScheme")
        }
    }
    
    var maintenanceLevel: UserPreferences.MaintenanceLevel? {
        get {
            let maintenanceLevelString = userPreferData.string(forKey: "maintenanceLevel")
            if let maintenanceLevelString {
                return UserPreferences.MaintenanceLevel(rawValue: maintenanceLevelString)
            }
            return nil
        }
        set {
            userPreferData.set(newValue?.rawValue, forKey: "maintenanceLevel")
        }
    }
    
    var productiveOrDecorative: UserPreferences.ProductiveOrDecorative? {
        get {
            let productiveOrDecorativeString = userPreferData.string(forKey: "productiveOrDecorative")
            if let productiveOrDecorativeString {
                return UserPreferences.ProductiveOrDecorative(rawValue: productiveOrDecorativeString)
            }
            return nil
        }
        set {
            userPreferData.set(newValue?.rawValue, forKey: "productiveOrDecorative")
        }
    }
}
