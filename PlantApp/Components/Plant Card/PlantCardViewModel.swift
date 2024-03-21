//
//  PlantCardViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/20/24.
//

import Foundation
import SwiftUI

class PlantCardViewModel: ObservableObject {
    @Published var plant: Plant
    
    init(plant: Plant) {
        self.plant = plant
    }
    
    func addToCart(cartManager: CartManager) {
        cartManager.addToCart(product: plant)
    }
}
