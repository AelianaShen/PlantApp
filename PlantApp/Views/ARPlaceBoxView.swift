//
//  ARPlaceBoxView.swift
//  PlantApp
//
//  Created by Aeliana Shen on 11/21/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ARPlaceBoxView : View {
    var body: some View {
        ARPlaceBoxViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARPlaceBoxViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)
        
        arView.addCoachingOverlay()
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}
