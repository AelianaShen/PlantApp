//
//  UserPreference.swift
//  PlantApp
//
//  Created by Aeliana Shen on 4/4/24.
//

import Foundation

enum UserPreferences {
    enum CareLevel: String, CaseIterable {
        case beginner
        case intermediate
        case advanced
    }
    
    enum LeafStyle: String, CaseIterable  {
        case dramatic
        case delicate
    }
    
    enum LightLevel: Int {
        case low = 1, medium, high, sunny
    }
    
    enum BoxLevel: Int {
        case small = 1, medium, large
    }
    
    enum PetFriendly: String, CaseIterable  {
        case yes
        case no
    }
    
    enum ColorScheme: String, CaseIterable  {
        case complement
        case contrast
    }
    
    enum MaintenanceLevel: String, CaseIterable  {
        case lowMaintenance = "low-maintenance"
        case moreEffort = "more effort"
    }
    
    enum ProductiveOrDecorative: String, CaseIterable  {
        case productive
        case decorative
    }
}
