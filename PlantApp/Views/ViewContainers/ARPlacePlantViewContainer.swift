//
//  ARPlacePlantViewContainer.swift
//  PlantApp
//
//  Created by Aeliana Shen on 2/20/24.
//
import SwiftUI
import RealityKit
import ARKit

struct ARPlacePlantViewContainer: UIViewRepresentable {
    private let plant: String
    
    init(plant: String) {
        self.plant = plant
    }
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(PlacePlantCoordinator.handleTap))
        tapGesture.delegate = context.coordinator
        arView.addGestureRecognizer(tapGesture)
        context.coordinator.arView = arView
        
        arView.addCoachingOverlay()
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> PlacePlantCoordinator {
        return PlacePlantCoordinator(plant: plant)
    }
}
