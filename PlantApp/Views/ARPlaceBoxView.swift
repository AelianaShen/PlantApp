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
    
    @State var boxSize: SIMD3<Float> = simd_float3(0, 0, 0)
    @State var confirmBoxSize: SIMD3<Float>  = simd_float3(0, 0, 0)
    @State private var useARKit = false
    
    var body: some View {
        if useARKit {   // when measure the lux level
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
        } else {    // when place the box and measure the box size
            ARPlaceBoxViewContainer(boxSize: $boxSize)
                .edgesIgnoringSafeArea(.all)
                .overlay(alignment: .bottom){
                    VStack {
                        Text("Click on the screen to place the box to set your plant position. Adjust the box size by two fingers.")
                            .multilineTextAlignment(.center)
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity,
                                alignment: .top)
                            .padding(20)
                        Button {
                            showConfirmMsg = true
                        } label: {
                            Image(systemName: "checkmark")
                                .frame(width: 60, height: 60)
                                .font(.title)
                                .background(Color.white
                                    .opacity(0.75))
                                .cornerRadius(30)
                                .padding(10)
                        }
                        .alert(String(format: "Your potential plant size is around %.2f %.2f %.2f meters", boxSize.x,boxSize.y,boxSize.z), isPresented: $showConfirmMsg){
                            Button("OK") {
                                self.confirmBoxSize = boxSize
                                self.useARKit = true
                            }
                            Button("Cancel", role: .cancel) {}
                        }
                        Text(String(format: "Size: %.2f %.2f %.2f meters", boxSize.x,boxSize.y,boxSize.z))
                            .padding()
                    }
                }
        }
    }
}
