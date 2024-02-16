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
    
    @State var showConfirmMsg: Bool = false
    @State var luxValue: CGFloat = 0
    @State var confirmLuxValue: CGFloat = 0
    @State private var useARKit = true
    
    var body: some View {
        if useARKit {   // when measure the lux level
            VStack {
                ARLuxMeasureViewContainer(luxValue: $luxValue)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(alignment: .bottom){
                        VStack {
                            Text("Avoid shaking the device, when the lux value becomes stable click the \(Image(systemName: "camera.metering.partial")) button to capture your environment light data.")
                                .multilineTextAlignment(.center)
                                .frame(
                                    maxWidth: .infinity,
                                    maxHeight: .infinity,
                                    alignment: .top)
                                .padding(20)
                            Button {
                                showConfirmMsg = true
                            } label: {
                                Image(systemName: "camera.metering.partial")
                                    .frame(width: 60, height: 60)
                                    .font(.title)
                                    .background(Color.white
                                        .opacity(0.75))
                                    .cornerRadius(30)
                                    .padding(10)
                            }
                            .alert(String(format: "Your indoor light Value is around %.2f ft-c (footcandle).", luxValue), isPresented: $showConfirmMsg){
                                Button("OK") {
                                    self.confirmLuxValue = luxValue
                                }
                                Button("Cancel", role: .cancel) {}
                            }
                            Text(String(format: "Lux Value: %.2f", luxValue))
                                .padding()
                        }
                    }
            }
        } else {    // when place the box and measure the box size
            ARPlaceBoxViewContainer().edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct ARPlaceBoxViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        context.coordinator.arView = arView
        context.coordinator.setupUI()
        
        arView.addCoachingOverlay()
        
        return arView
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

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
