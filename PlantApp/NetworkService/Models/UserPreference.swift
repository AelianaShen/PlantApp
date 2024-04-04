//
//  UserPreference.swift
//  PlantApp
//
//  Created by Aeliana Shen on 4/4/24.
//

import Foundation

enum UserPreferences {
    enum CareLevel: String {
        case beginner
        case intermediate
        case advanced
    }
    
    enum LeafStyle: String {
        case dramatic
        case delicate
    }
    
    enum LightLevel: Int {
        case low = 1, medium, high, sunny
    }
    
    enum BoxLevel: Int {
        case small = 1, medium, large
    }
    
    enum PetFriendly: String {
        case yes
        case no
    }
    
    enum ColorScheme: String {
        case complement
        case contrast
    }
    
    enum MaintenanceLevel: String {
        case lowMaintenance
        case moreEffort
    }
    
    enum ProductiveOrDecorative: String {
        case productive
        case decorative
    }
}
