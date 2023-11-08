//
//  ContentARView.swift
//  PlantApp
//
//  Created by Aeliana Shen on 11/6/23.
//

import SwiftUI
import RealityKit

struct ContentARView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        // let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        // arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentARView_Previews : PreviewProvider {
    static var previews: some View {
        ContentARView()
    }
}
#endif
