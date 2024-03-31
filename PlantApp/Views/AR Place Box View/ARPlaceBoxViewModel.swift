//
//  ARPlaceBoxViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI
import RealityKit

@Observable class ARPlaceBoxViewModel {
    var showConfirmMsg: Bool = false
    var luxValue: CGFloat = 0
    var confirmLuxValue: CGFloat = 0
    
    var boxSize: SIMD3<Float> = simd_float3(0, 0, 0)
    var confirmBoxSize: SIMD3<Float> = simd_float3(0, 0, 0)
    var useARKit = false

    var luxValueBinding: Binding<CGFloat> {
        Binding(
            get: { self.luxValue },
            set: { self.luxValue = $0 }
        )
    }

    var showConfirmMsgBinding: Binding<Bool> {
        Binding(
            get: { self.showConfirmMsg },
            set: { self.showConfirmMsg = $0 }
        )
    }

    var boxSizeBinding: Binding<SIMD3<Float>> {
        Binding(
            get: { self.boxSize },
            set: { self.boxSize = $0 }
        )
    }
}
