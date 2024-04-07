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
    private let userDefaults : UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    var careLevel: UserPreferences.CareLevel? {
        get {
            let careLevelString = userDefaults.string(forKey: "careLevel")
            if let careLevelString {
                return UserPreferences.CareLevel(rawValue: careLevelString)
            }
            return nil
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "careLevel")
        }
    }
    
    var leafStyle: UserPreferences.LeafStyle? {
        get {
            let leafStyleString = userDefaults.string(forKey: "leafStyle")
            if let leafStyleString {
                return UserPreferences.LeafStyle(rawValue: leafStyleString)
            }
            return nil
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "leafStyle")
        }
    }
    
    var lightLevel: UserPreferences.LightLevel? {
        get {
            let lightLevelInt = userDefaults.integer(forKey: "lightLevel")
            return UserPreferences.LightLevel(rawValue: lightLevelInt)
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "lightLevel")
        }
    }
    
    var boxLevel: UserPreferences.BoxLevel? {
        get {
            let boxLevelInt = userDefaults.integer(forKey: "boxLevel")
            return UserPreferences.BoxLevel(rawValue: boxLevelInt)
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "boxLevel")
        }
    }
    
    var petFriendly: UserPreferences.PetFriendly? {
        get {
            let petFriendlyString = userDefaults.string(forKey: "petFriendly")
            if let petFriendlyString {
                return UserPreferences.PetFriendly(rawValue: petFriendlyString)
            }
            return nil
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "petFriendly")
        }
    }
    
    var colorScheme: UserPreferences.ColorScheme? {
        get {
            let colorSchemeString = userDefaults.string(forKey: "colorScheme")
            if let colorSchemeString {
                return UserPreferences.ColorScheme(rawValue: colorSchemeString)
            }
            return nil
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "colorScheme")
        }
    }
    
    var maintenanceLevel: UserPreferences.MaintenanceLevel? {
        get {
            let maintenanceLevelString = userDefaults.string(forKey: "maintenanceLevel")
            if let maintenanceLevelString {
                return UserPreferences.MaintenanceLevel(rawValue: maintenanceLevelString)
            }
            return nil
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "maintenanceLevel")
        }
    }
    
    var productiveOrDecorative: UserPreferences.ProductiveOrDecorative? {
        get {
            let productiveOrDecorativeString = userDefaults.string(forKey: "productiveOrDecorative")
            if let productiveOrDecorativeString {
                return UserPreferences.ProductiveOrDecorative(rawValue: productiveOrDecorativeString)
            }
            return nil
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "productiveOrDecorative")
        }
    }
}
