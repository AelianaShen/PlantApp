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
        ARPlacePlantViewContainer(plant: viewModel.plant)
            .edgesIgnoringSafeArea(.all)
            .overlay(alignment: .top){
                guideline
            }
    }
    
    private var guideline: some View {
        Text(viewModel.guidelineString)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(20)
    }
}
