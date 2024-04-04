//
//  MockUserPreferences.swift
//  PlantAppTests
//
//  Created by Aeliana Shen on 4/3/24.
//

import Foundation
@testable import PlantApp

class MockUserPreferences: UserPreferences {
    var color_scheme: String? = nil
    var maintenance_level: String? = nil
    var care_level: String? = nil
    var leaf_style: String? = nil
    var light_level: String? = nil
    var box_level: String? = nil
    var pet_friendly: String? = nil
    var productive_or_decorative: String? = nil
}
