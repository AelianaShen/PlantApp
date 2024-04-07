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
            guard let careLevelString = userDefaults.string(forKey: "careLevel") else {
               return nil
            }
            return UserPreferences.CareLevel(rawValue: careLevelString)
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "careLevel")
        }
    }
    
    var leafStyle: UserPreferences.LeafStyle? {
        get {
            guard let leafStyleString = userDefaults.string(forKey: "leafStyle") else {
               return nil
            }
            return UserPreferences.LeafStyle(rawValue: leafStyleString)
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
            guard let petFriendlyString = userDefaults.string(forKey: "petFriendly") else {
               return nil
            }
            return UserPreferences.PetFriendly(rawValue: petFriendlyString)
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "petFriendly")
        }
    }
    
    var colorScheme: UserPreferences.ColorScheme? {
        get {
            guard let colorSchemeString = userDefaults.string(forKey: "colorScheme") else {
               return nil
            }
            return UserPreferences.ColorScheme(rawValue: colorSchemeString)
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "colorScheme")
        }
    }
    
    var maintenanceLevel: UserPreferences.MaintenanceLevel? {
        get {
            guard let maintenanceLevelString = userDefaults.string(forKey: "maintenanceLevel") else {
               return nil
            }
            return UserPreferences.MaintenanceLevel(rawValue: maintenanceLevelString)
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "maintenanceLevel")
        }
    }
    
    var productiveOrDecorative: UserPreferences.ProductiveOrDecorative? {
        get {
            guard let productiveOrDecorativeString = userDefaults.string(forKey: "productiveOrDecorative") else {
               return nil
            }
            return UserPreferences.ProductiveOrDecorative(rawValue: productiveOrDecorativeString)
        }
        set {
            userDefaults.set(newValue?.rawValue, forKey: "productiveOrDecorative")
        }
    }
}
