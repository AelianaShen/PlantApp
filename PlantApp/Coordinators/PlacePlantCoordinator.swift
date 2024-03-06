//
//  PlacePlantCoordinator.swift
//  PlantApp
//
//  Created by Aeliana Shen on 2/20/24.
//

import RealityKit
import ARKit
import SwiftUI
import Combine

class PlacePlantCoordinator: NSObject, UIGestureRecognizerDelegate {
    var arView: ARView?
    var anchor: AnchorEntity?
    var plant: String
    
    init(plant: String) {
        self.plant = plant
    }
    
    @objc func handleTap(_ reconizer: UITapGestureRecognizer) {
        guard let arView = arView else { return }
        let tappedLocation = reconizer.location(in: arView)
        
        let modelName = plant //"golden_pothos"
        let modelEntity = try! Entity.loadModel(named: modelName + ".usdz")
        
        let results = arView.raycast(from: tappedLocation, allowing: .estimatedPlane, alignment: .horizontal)
        if let result = results.first {
            if anchor == nil {
                anchor = AnchorEntity()
                anchor?.transform = Transform(matrix: result.worldTransform)
                anchor?.addChild(modelEntity)
                
                guard let anchor = anchor else {
                    return
                }
                arView.scene.addAnchor(anchor)
            }
        }
    }
}
