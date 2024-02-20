//
//  ARPlaceBoxViewContainer.swift
//  PlantApp
//
//  Created by Aeliana Shen on 2/16/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ARPlaceBoxViewContainer: UIViewRepresentable {
    @Binding var boxSize: SIMD3<Float>
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap))
        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleScale))
        
        tapGesture.delegate = context.coordinator
        pinchGesture.delegate = context.coordinator
                
        arView.addGestureRecognizer(tapGesture)
        arView.addGestureRecognizer(pinchGesture)
        context.coordinator.arView = arView
        
        arView.addCoachingOverlay()
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(boxSize: $boxSize)
    }
}
