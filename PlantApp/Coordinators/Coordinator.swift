//
//  Coordinator.swift
//  PlantApp
//
//  Created by Aeliana Shen on 2/14/24.
//

import Foundation
import RealityKit
import ARKit
import SwiftUI
import Combine

class Coordinator {
    var arView: ARView?
    var boxAnchor: AnchorEntity?
    var cancellable: AnyCancellable?
    
    @Binding var boxSize: SIMD3<Float>
    
    init(boxSize: Binding<SIMD3<Float>>) {
        _boxSize = boxSize
    }
    
    @objc func handleTap(_ reconizer: UITapGestureRecognizer) {
        guard let arView = arView else { return }
        let tappedLocation = reconizer.location(in: arView)
        
        let results = arView.raycast(from: tappedLocation, allowing: .estimatedPlane, alignment: .horizontal)
        if let result = results.first {
            if boxAnchor == nil {
                boxAnchor = AnchorEntity(raycastResult: result)
                let mesh = MeshResource.generateBox(size: 0.1)
                let material = SimpleMaterial(color: .green, roughness: 0.5, isMetallic: true)
                let modelEntity = ModelEntity(mesh: mesh, materials: [material])
                
                boxAnchor?.addChild(modelEntity)
                
                guard let boxAnchor = boxAnchor else {
                    return
                }
                arView.scene.addAnchor(boxAnchor)
                
                modelEntity.name = "modelEntity"
                modelEntity.generateCollisionShapes(recursive: true)
                arView.installGestures([.rotation, .scale], for: modelEntity)
                
                DispatchQueue.main.async {
                    self.boxSize = arView.scene.findEntity(named: "modelEntity")!.visualBounds(relativeTo: nil).extents
                }
            }
        }
    }
}
