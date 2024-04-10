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
        
        guard let contentsPath = getPathForFile(name: plant) else { return }
        guard let modelEntity = try? Entity.loadModel(contentsOf: contentsPath) else {
            print("Failed to load model: \(plant)")
            return
        }
        
        let results = arView.raycast(from: tappedLocation, allowing: .estimatedPlane, alignment: .horizontal)
        if let result = results.first, anchor == nil {
            let anchor = AnchorEntity()
            anchor.transform = Transform(matrix: result.worldTransform)
            anchor.addChild(modelEntity)
            arView.scene.addAnchor(anchor)
        }
    }
    
    func getPathForFile(name: String) -> URL? {
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("\(name).usdz") else {
            print("Error getting path.")
            return nil
        }
        return path
    }
}
