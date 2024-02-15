//
//  Coordinator.swift
//  PlantApp
//
//  Created by Aeliana Shen on 2/14/24.
//

import Foundation
import RealityKit
import SwiftUI
import Combine

class Coordinator {
    var arView: ARView?
    var boxAnchor: AnchorEntity?
    var cancellable: AnyCancellable?
    
    lazy var measurementButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("0.00", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    lazy var getSizeButton: UIButton = {
        
        let button = UIButton(configuration: .gray(), primaryAction: UIAction(handler: { [weak self] action in
            guard let arView = self?.arView else { return }
            
            let boxSize: SIMD3<Float> = arView.scene.findEntity(named: "modelEntity")!.visualBounds(relativeTo: nil).extents
            self!.measurementButton.setTitle(String(format: "%.2f %.2f %.2f meters", boxSize.x,boxSize.y,boxSize.z), for: .normal)
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("get size", for: .normal)
        return button
    }()

    lazy var guideMessage: UILabel = {
        let message = UILabel()
        message.text = "Click the screen to place the box."
        message.textColor = UIColor.white
        return message
    }()
    
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
            }
        }
    }
    
    func setupUI() {
        
        guard let arView = arView else { return }
        
        let stackView = UIStackView(arrangedSubviews: [measurementButton, getSizeButton])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        arView.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: arView.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: arView.bottomAnchor, constant: -60).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        let stackView2 = UIStackView(arrangedSubviews: [guideMessage])
        stackView2.axis = .vertical
        stackView2.spacing = 8
        stackView2.distribution = .fillEqually
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        arView.addSubview(stackView2)
        
        stackView2.centerXAnchor.constraint(equalTo: arView.centerXAnchor).isActive = true
        stackView2.topAnchor.constraint(equalTo: arView.topAnchor, constant: 80).isActive = true
        stackView2.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
}
