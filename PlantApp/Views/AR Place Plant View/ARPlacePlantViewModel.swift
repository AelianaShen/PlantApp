//
//  ARPlacePlantViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI

class ARPlacePlantViewModel: ObservableObject {
    var plant: String
    let guidelineString = "Simply touch the screen to add the plant to your home!"
    
    init(plant: String) {
        self.plant = plant
    }
}
