//
//  ARPlaceBoxViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI
import RealityKit

class ARPlaceBoxViewModel: ObservableObject {
    @Published var showConfirmMsg: Bool = false
    
    @Published var luxValue: CGFloat = 0
    var lightLevel: UserPreferences.LightLevel = UserPreferences.LightLevel.none
    var confirmLuxValue: CGFloat = 0
    
    @Published var boxSize: SIMD3<Float> = simd_float3(0, 0, 0)
    var boxLevel: UserPreferences.BoxLevel = UserPreferences.BoxLevel.none
    var confirmBoxSize: SIMD3<Float>  = simd_float3(0, 0, 0)
    
    var useARKit = false
    
    private var userPreferences: UserPreferencesStore
    
    init(userPreferences: UserPreferencesStore = UserPreferencesStoreImpl()){
        self.userPreferences = userPreferences
    }
    
    func saveLuxValue() {
        if confirmLuxValue > 25, confirmLuxValue <= 75 {
            lightLevel = UserPreferences.LightLevel.low
        } else if confirmLuxValue > 75, confirmLuxValue <= 200 {
            lightLevel = UserPreferences.LightLevel.medium
        } else if confirmLuxValue > 200 {
            lightLevel = UserPreferences.LightLevel.high
        } else {
            lightLevel = UserPreferences.LightLevel.none
        }
        userPreferences.lightLevel = lightLevel
    }
    
    func clearLuxValue() {
        userPreferences.lightLevel = UserPreferences.LightLevel.none
    }
    
    func saveBoxSize() {
        let plantPotDiameter = confirmBoxSize.x
        if plantPotDiameter <= 0.2 {
            boxLevel = UserPreferences.BoxLevel.small
        } else if plantPotDiameter > 0.2, plantPotDiameter <= 0.32 {
            boxLevel = UserPreferences.BoxLevel.medium
        } else if plantPotDiameter > 0.32 {
            boxLevel = UserPreferences.BoxLevel.large
        } else {
            boxLevel = UserPreferences.BoxLevel.none
        }
        userPreferences.boxLevel = boxLevel
    }
    
    func clearBoxSize() {
        userPreferences.boxLevel = UserPreferences.BoxLevel.none
    }
}
