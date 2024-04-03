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
    @Published var lightLevel: Int = 2
    
    @Published var boxSize: SIMD3<Float> = simd_float3(0, 0, 0)
    @Published var confirmBoxSize: SIMD3<Float>  = simd_float3(0, 0, 0)
    @Published var useARKit = false
    @Published var boxLevel: Int = 2
    
    func saveLuxValue() {
        if confirmLuxValue > 25, confirmLuxValue <= 75 {
            lightLevel = 1
        } else if confirmLuxValue > 75, confirmLuxValue <= 200 {
            lightLevel = 2
        } else if confirmLuxValue > 200 {
            lightLevel = 3
        }
        UserDefaults.standard.set(lightLevel, forKey: "light_level")
    }
    
    func clearLuxValue() {
        UserDefaults.standard.set(nil, forKey: "light_level")
    }
    
    func saveBoxSize() {
        let confirmBoxDiam = confirmBoxSize.x
        if confirmBoxDiam <= 0.2 {
            boxLevel = 1
        } else if confirmBoxDiam > 0.2, confirmBoxDiam <= 0.32 {
            boxLevel = 2
        } else if confirmBoxDiam > 0.32 {
            boxLevel = 3
        }
        UserDefaults.standard.set(boxLevel, forKey: "box_level")
    }
    
    func clearBoxSize() {
        UserDefaults.standard.set(nil, forKey: "box_level")
    }
}
