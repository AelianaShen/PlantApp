//
//  ProductRowViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/21/24.
//

import Foundation
import SwiftUI

class ProductRowViewModel: ObservableObject {
    @Published var plant: Plant
    
    init(plant: Plant) {
        self.plant = plant
    }
    
    func removeFromCart(cartManager: CartManager) {
        cartManager.removeFromCart(product: plant)
    }
}
