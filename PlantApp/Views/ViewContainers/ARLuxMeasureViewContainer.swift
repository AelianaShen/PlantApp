//
//  ARLuxMeasureViewContainer.swift
//  PlantApp
//
//  Created by Aeliana Shen on 2/16/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ARLuxMeasureViewContainer: UIViewRepresentable {
    @Binding var luxValue: CGFloat
    
    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        
        if
            ARWorldTrackingConfiguration
                .supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        arView.session.run(config)
        arView.delegate = context.coordinator
        return arView
    }
    
    func updateUIView(_ uiView: ARSCNView, context: Context) {}
    
    func makeCoordinator() -> LuxMeasureCoordinator {
        return LuxMeasureCoordinator(luxValue: $luxValue)
    }
}
