//
//  MockUserPreferences.swift
//  PlantAppTests
//
//  Created by Aeliana Shen on 4/3/24.
//

import Foundation
@testable import PlantApp

class MockUserPreferencesStore: UserPreferencesStore {
    var careLevel: UserPreferences.CareLevel? = nil
    var leafStyle: UserPreferences.LeafStyle? = nil
    var lightLevel: UserPreferences.LightLevel? = nil
    var boxLevel: UserPreferences.BoxLevel? = nil
    var petFriendly: UserPreferences.PetFriendly? = nil
    var colorScheme: UserPreferences.ColorScheme? = nil
    var maintenanceLevel: UserPreferences.MaintenanceLevel? = nil
    var productiveOrDecorative: UserPreferences.ProductiveOrDecorative? = nil
    
    func setCareLevel(option: String?) {}
    func setLeafStyle(option: String?) {}
    func setLightLevel(option: Int?) {}
    func setBoxLevel(option: Int?) {}
    func setPetFriendly(option: String?) {}
    func setColorScheme(option: String?) {}
    func setMaintenanceLevel(option: String?) {}
    func setProductiveOrDecorative(option: String?) {}
}
