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

class Coordinator: NSObject, ARSessionDelegate, UIGestureRecognizerDelegate {
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
                boxAnchor = AnchorEntity()
                boxAnchor?.transform = Transform(matrix: result.worldTransform)
                
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
    
    @objc func handleScale(_ gesture: UIPinchGestureRecognizer) {
        guard let arView = arView else { return }
        guard let modelEntity = arView.scene.findEntity(named: "modelEntity") else { return }
        
        switch gesture.state {
            case .began, .changed:
                let scale = modelEntity.transform.scale * Float(gesture.scale)
                modelEntity.transform.scale = scale
                gesture.scale = 1
                DispatchQueue.main.async {
                    self.boxSize = modelEntity.visualBounds(relativeTo: nil).extents
                }
            default:
                break
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
            return true
    }
    
    //    Here is other method to update the size
    //    @objc func handleScale(_ gesture: UIPinchGestureRecognizer) {
    //        guard let arView = arView else { return }
    //        guard let modelEntity = self.modelEntity else { return }
    //
    //        // Update boxSize state with the new scale
    //        withAnimation {
    //            self.boxSize = modelEntity.visualBounds(relativeTo: nil).extents
    //        }
    //    }
}
