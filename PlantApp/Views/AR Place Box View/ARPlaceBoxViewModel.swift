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
        UserDefaults.standard.set(lightLevel, forKey: "lightLevel")
    }
    
    func clearLuxValue() {
        UserDefaults.standard.set(
            UserPreferences.LightLevel.none.rawValue,
            forKey: "lightLevel"
        )
    }
    
    func saveBoxSize() {
        let confirmBoxDiam = confirmBoxSize.x
        if confirmBoxDiam <= 0.2 {
            boxLevel = UserPreferences.BoxLevel.small.rawValue
        } else if confirmBoxDiam > 0.2, confirmBoxDiam <= 0.32 {
            boxLevel = UserPreferences.BoxLevel.medium.rawValue
        } else if confirmBoxDiam > 0.32 {
            boxLevel = UserPreferences.BoxLevel.large.rawValue
        } else {
            boxLevel = UserPreferences.BoxLevel.none.rawValue
        }
        UserDefaults.standard.set(boxLevel, forKey: "boxLevel")
    }
    
    func clearBoxSize() {
        UserDefaults.standard.set(
            UserPreferences.BoxLevel.none.rawValue,
            forKey: "boxLevel"
        )
    }
}
