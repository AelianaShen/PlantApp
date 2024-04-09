//
//  ARPlacePlantView.swift
//  PlantApp
//
//  Created by Aeliana Shen on 2/20/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ARPlacePlantView : View {
    @StateObject var viewModel: ARPlacePlantViewModel
    
    var body: some View {
        VStack {
                ARPlacePlantViewContainer(plant: viewModel.plant)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(alignment: .top){
                        Text(viewModel.guidelineString)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                            .padding(20)
                    }
                    .overlay(alignment: .center, content: {
                        if viewModel.isLoadingPlantModel {
                            ProgressView(value: viewModel.progressNumber, total: 1.0) {
                                Text("3D Model downloading \(Int(viewModel.progressNumber * 100))%")
                            }
                            .progressViewStyle(.linear)
                            .frame(width: 300, height: 680, alignment: .center)
                            .padding(20)
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                        }
                    })
        }
        .task {
            await viewModel.downloadPlantModel()
        }
    }
    
    private var guideline: some View {
        Text(viewModel.guidelineString)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(20)
    }
}

#Preview {
    ARPlacePlantView(viewModel: ARPlacePlantViewModel(plant: "golden_pothos"))
}
