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
    var luxConfirmMsgString: String = "Your indoor light Value is around %.2f ft-c (footcandle)."
    
    @Published var luxValue: CGFloat = 0
    var lightLevel: UserPreferences.LightLevel? = nil
    
    @Published var boxSize: SIMD3<Float> = simd_float3(0, 0, 0)
    var boxLevel: UserPreferences.BoxLevel = UserPreferences.BoxLevel.none
    var confirmBoxSize: SIMD3<Float>  = simd_float3(0, 0, 0)
    
    var useARKit = false
    
    private var userPreferences: UserPreferencesStore
    
    init(userPreferences: UserPreferencesStore = UserPreferencesStoreImpl()){
        self.userPreferences = userPreferences
    }
    
    func saveLuxValue() {
        if luxValue >= 25, luxValue < 75 {
            lightLevel = UserPreferences.LightLevel.low
        } else if luxValue >= 75, luxValue < 200 {
            lightLevel = UserPreferences.LightLevel.medium
        } else if luxValue >= 200 {
            lightLevel = UserPreferences.LightLevel.high
        }
        userPreferences.lightLevel = lightLevel
    }
    
    func clearLuxValue() {
        lightLevel = nil
        userPreferences.lightLevel = lightLevel
    }
    
    func updateConfirmMsg() {
        if luxValue < 25 {
            self.luxConfirmMsgString = "Your indoor light Value is around %.2f ft-c (footcandle). It is too low for the indoor plant. \n\n - OK to disable filter\n - Cancel to measure again"
        } else {
            self.luxConfirmMsgString = "Your indoor light Value is around %.2f ft-c (footcandle). \n\n - OK to apply filter\n - Cancel to disable filter"
        }
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
