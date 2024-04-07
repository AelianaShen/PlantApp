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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel = ARPlaceBoxViewModel()
    
    var body: some View {
        if viewModel.useARKit {
            ARLuxMeasureViewContainer(luxValue: $viewModel.luxValue)
                .edgesIgnoringSafeArea(.all)
                .overlay(alignment: .bottom) {
                    VStack {
                        luxGuideline
                        captureButton
                        luxValueLabel
                    }
                }
        } else {
            ARPlaceBoxViewContainer(boxSize: $viewModel.boxSize)
                .edgesIgnoringSafeArea(.all)
                .overlay(alignment: .bottom) {
                    VStack {
                        placeBoxGuideline
                        confirmPlacingButton
                        boxsizeLabel
                    }
                }
        }
    }
    
    private var luxGuideline: some View {
        Text("Avoid shaking the device, when the lux value becomes stable click the \(Image(systemName: "camera.metering.partial")) button to capture your environment light data.")
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(20)
    }
    
    private var captureButton: some View {
        Button {
            viewModel.showConfirmMsg = true
            viewModel.updateConfirmMsg()
            viewModel.saveLuxValue()
        } label: {
            Image(systemName: "camera.metering.partial")
                .frame(width: 60, height: 60)
                .font(.title)
                .background(Color.white.opacity(0.75))
                .cornerRadius(30)
                .padding(10)
        }
        .alert(
            String(format: viewModel.luxConfirmMsgString, viewModel.luxValue),
            isPresented: $viewModel.showConfirmMsg
        ){
            Button("OK") {}
            Button("Cancel") {
                viewModel.clearLuxValue()
            }
            Button("skip light measurement") {
                viewModel.clearLuxValue()
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    private var luxValueLabel: some View {
        Text(String(format: "Lux Value: %.2f", viewModel.luxValue))
            .padding()
    }
    
    private var placeBoxGuideline: some View {
        Text("Click on the screen to place the box to set your plant position. Adjust the box size by two fingers.")
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(20)
    }
    
    private var confirmPlacingButton: some View {
        Button {
            viewModel.showConfirmMsg = true
        } label: {
            Image(systemName: "checkmark")
                .frame(width: 60, height: 60)
                .font(.title)
                .background(Color.white.opacity(0.75))
                .cornerRadius(30)
                .padding(10)
        }
        .alert(String(format: "Your potential plant size is around %.2f %.2f %.2f meters. \n\n - OK to apply filter\n - Cancel to measure again", viewModel.boxSize.x, viewModel.boxSize.y, viewModel.boxSize.z), isPresented: $viewModel.showConfirmMsg){
            Button("OK") {
                viewModel.saveBoxSize()
                viewModel.useARKit = true
            }.task {
                viewModel.confirmBoxSize = viewModel.boxSize
            }
            Button("Cancel") {
                viewModel.clearBoxSize()
            }
            Button("skip size measurement") {
                viewModel.clearBoxSize()
                viewModel.useARKit = true
            }
        }
    }
    
    private var boxsizeLabel: some View {
        Text(String(format: "Size: %.2f %.2f %.2f meters", viewModel.boxSize.x, viewModel.boxSize.y, viewModel.boxSize.z))
            .padding()
    }
}
