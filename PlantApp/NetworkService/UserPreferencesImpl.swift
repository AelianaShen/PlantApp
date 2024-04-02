//
//  UserPreferencesImpl.swift
//  PlantApp
//
//  Created by Aeliana Shen on 4/1/24.
//

import Foundation

protocol UserPreferences {
    var care_level: String? { get set }
    var leaf_style: String? { get set }
    var light_level: String? { get set }
    var pet_friendly: String? { get set }
    var productive_or_decorative: String? { get set }
}

class UserPreferencesImpl: UserPreferences {
    var care_level: String?
    var leaf_style: String?
    var light_level: String?
    var pet_friendly: String?
    var productive_or_decorative: String?
    
    init() {
        let userPreferData = UserDefaults.standard
        care_level = userPreferData.string(forKey: "care_level")
        leaf_style = userPreferData.string(forKey: "leaf_style")
        light_level = userPreferData.string(forKey: "light_level")
        pet_friendly = userPreferData.string(forKey: "pet_friendly")
        productive_or_decorative = userPreferData.string(forKey: "productive_or_decorative")
    }
}
