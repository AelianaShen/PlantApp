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
    var plant: String
    
    var body: some View {
        ARPlacePlantViewContainer(plant: plant)
            .edgesIgnoringSafeArea(.all)
            .overlay(alignment: .top){
                    Text("Simply touch the screen to add the plant to your home!")
                        .multilineTextAlignment(.center)
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .top)
                        .padding(20)
        }
    }
}
