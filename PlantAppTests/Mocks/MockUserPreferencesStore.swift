//
//  MockUserPreferences.swift
//  PlantAppTests
//
//  Created by Aeliana Shen on 4/3/24.
//

import Foundation
@testable import PlantApp

class MockUserPreferencesStore: UserPreferencesStore {
    var colorScheme: String? = nil
    var maintenanceLevel: String? = nil
    var careLevel: String? = nil
    var leafStyle: String? = nil
    var lightLevel: String? = nil
    var boxLevel: String? = nil
    var petFriendly: String? = nil
    var productiveOrDecorative: String? = nil
}
