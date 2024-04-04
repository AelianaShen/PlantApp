//
//  UserPreferencesImpl.swift
//  PlantApp
//
//  Created by Aeliana Shen on 4/1/24.
//

import Foundation

protocol UserPreferencesStore {
    var care_level: String? { get set }
    var leaf_style: String? { get set }
    var light_level: String? { get set }
    var box_level: String? { get set }
    var pet_friendly: String? { get set }
    var color_scheme: String? { get set }
    var maintenance_level: String? { get set }
    var productive_or_decorative: String? { get set }
}

class UserPreferencesStoreImpl: UserPreferencesStore {
    let userPreferData = UserDefaults.standard
    
    var care_level: String?
    var leaf_style: String?
    var light_level: String?
    var box_level: String?
    var pet_friendly: String?
    var color_scheme: String?
    var maintenance_level: String?
    var productive_or_decorative: String?
    
    init() {
        care_level = userPreferData.string(forKey: "care_level")
        leaf_style = userPreferData.string(forKey: "leaf_style")
        light_level = userPreferData.string(forKey: "light_level")
        box_level = userPreferData.string(forKey: "box_level")
        pet_friendly = userPreferData.string(forKey: "pet_friendly")
        color_scheme = userPreferData.string(forKey: "color_scheme")
        maintenance_level = userPreferData.string(forKey: "maintenance_level")
        productive_or_decorative = userPreferData.string(forKey: "productive_or_decorative")
    }
    
    func set_care_level(option: String?) {
        userPreferData.set(option, forKey: "care_level")
    }
    
    func set_leaf_style(option: String?) {
        userPreferData.set(option, forKey: "leaf_style")
    }
    
    func set_light_level(option: String?) {
        userPreferData.set(option, forKey: "light_level")
    }
    
    func set_box_level(option: String?) {
        userPreferData.set(option, forKey: "box_level")
    }
    
    func set_pet_friendly(option: String?) {
        userPreferData.set(option, forKey: "pet_friendly")
    }
    
    func set_color_scheme(option: String?) {
        userPreferData.set(option, forKey: "color_scheme")
    }
    
    func set_maintenance_level(option: String?) {
        userPreferData.set(option, forKey: "maintenance_level")
    }
    
    func set_productive_or_decorative(option: String?) {
        userPreferData.set(option, forKey: "productive_or_decorative")
    }
}
