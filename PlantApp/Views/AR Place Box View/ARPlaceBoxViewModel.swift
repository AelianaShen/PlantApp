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
    
    @Published var boxSize: SIMD3<Float> = simd_float3(0, 0, 0)
    @Published var confirmBoxSize: SIMD3<Float>  = simd_float3(0, 0, 0)
    @Published var useARKit = false
}
