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
    var boxConfirmMsgString: String = "Your potential plant size is around %.2f %.2f %.2f meters."
    
    @Published var luxValue: CGFloat = 0
    var lightLevel: UserPreferences.LightLevel? = nil
    
    @Published var boxSize: SIMD3<Float> = simd_float3(0, 0, 0)
    var boxLevel: UserPreferences.BoxLevel? = nil
    
    var isGoToLuxMeasurement = false
    
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
    
    func updateLuxConfirmMsg() {
        if luxValue < 25 {
            self.luxConfirmMsgString = "Your indoor light Value is around %.2f ft-c (footcandle). It is too low for the indoor plant. \n\n - OK to disable filter\n - Cancel to measure again"
        } else {
            self.luxConfirmMsgString = "Your indoor light Value is around %.2f ft-c (footcandle). \n\n - OK to apply filter\n - Cancel to measure again"
        }
    }
    
    func saveBoxSize() {
        let potDiameter = boxSize.x
        
        if potDiameter >= 0.1, potDiameter <= 0.2 {
            boxLevel = UserPreferences.BoxLevel.small
        } else if potDiameter > 0.2, potDiameter <= 0.32 {
            boxLevel = UserPreferences.BoxLevel.medium
        } else if potDiameter > 0.32, potDiameter <= 0.5 {
            boxLevel = UserPreferences.BoxLevel.large
        }
        userPreferences.boxLevel = boxLevel
    }
    
    func clearBoxSize() {
        userPreferences.boxLevel = nil
    }
    
    func updateBoxConfirmMsg() {
        let potDiameter = boxSize.x
        if potDiameter < 0.1 || potDiameter > 0.5 {
            boxConfirmMsgString = "Your potential plant size is around %.2f %.2f %.2f meters. Sorry we don't have any pot suit this size. \n\n - OK to disable filter\n - Cancel to measure again"
        } else {
            boxConfirmMsgString = "Your potential plant size is around %.2f %.2f %.2f meters. \n\n - OK to apply filter\n - Cancel to measure again"
        }
    }
}
