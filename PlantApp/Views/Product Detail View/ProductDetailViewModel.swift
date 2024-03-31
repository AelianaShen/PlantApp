//
//  ProductDetailViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/21/24.
//

import Foundation
import SwiftUI

class ProductDetailViewModel: ObservableObject {
    @Published var plant: Plant
    
    init(plant: Plant) {
        self.plant = plant
    }
    
    // Add any additional methods or properties needed for the view here
    func addToCart() {
        // Logic for adding the product to the cart
    }
    
    func startARSimulation() {
        // Logic for starting the AR simulation
    }
}
