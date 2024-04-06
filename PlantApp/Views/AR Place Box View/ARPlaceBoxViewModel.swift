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
    @Published var confirmLuxValue: CGFloat = 0
    @Published var lightLevel: Int = UserPreferences.LightLevel.none.rawValue
    
    @Published var boxSize: SIMD3<Float> = simd_float3(0, 0, 0)
    @Published var confirmBoxSize: SIMD3<Float>  = simd_float3(0, 0, 0)
    @Published var useARKit = false
    @Published var boxLevel: Int = UserPreferences.BoxLevel.none.rawValue
    
    let userPreferences: UserPreferencesStore = UserPreferencesStoreImpl()
    
    func saveLuxValue() {
        if confirmLuxValue > 25, confirmLuxValue <= 75 {
            lightLevel = UserPreferences.LightLevel.low.rawValue
        } else if confirmLuxValue > 75, confirmLuxValue <= 200 {
            lightLevel = UserPreferences.LightLevel.medium.rawValue
        } else if confirmLuxValue > 200 {
            lightLevel = UserPreferences.LightLevel.high.rawValue
        } else {
            lightLevel = UserPreferences.LightLevel.none.rawValue
        }
        userPreferences.setLightLevel(option: lightLevel)
    }
    
    func clearLuxValue() {
        userPreferences.setLightLevel(option: UserPreferences.LightLevel.none.rawValue)
    }
    
    func saveBoxSize() {
        let plantPotDiameter = confirmBoxSize.x
        if plantPotDiameter <= 0.2 {
            boxLevel = UserPreferences.BoxLevel.small.rawValue
        } else if plantPotDiameter > 0.2, plantPotDiameter <= 0.32 {
            boxLevel = UserPreferences.BoxLevel.medium.rawValue
        } else if plantPotDiameter > 0.32 {
            boxLevel = UserPreferences.BoxLevel.large.rawValue
        } else {
            boxLevel = UserPreferences.BoxLevel.none.rawValue
        }
        userPreferences.setBoxLevel(option: boxLevel)
    }
    
    func clearBoxSize() {
        userPreferences.setBoxLevel(option: UserPreferences.BoxLevel.none.rawValue)
    }
}
