//
//  LuxMeasureCoordinator.swift
//  PlantApp
//
//  Created by Aeliana Shen on 2/15/24.
//

import SwiftUI
import ARKit

class LuxMeasureCoordinator: NSObject, ARSCNViewDelegate {
    @Binding var luxValue: CGFloat
    
    init(luxValue: Binding<CGFloat>) {
        _luxValue = luxValue
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if let sceneView = renderer as? ARSCNView,
           let lightEstimate = sceneView.session.currentFrame?.lightEstimate {
            DispatchQueue.main.async {
                self.luxValue = lightEstimate.ambientIntensity / 10.764
            }
        }
    }
}
