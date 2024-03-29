//
//  PlantCardViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/20/24.
//

import Foundation
import SwiftUI

class PlantCardViewModel {

    // MARK: - Properties

    private let plant: Plant
    private let cartManager: CartManaging

    // MARK: - Initialization

    init(plant: Plant, cartManager: CartManaging) {
        self.plant = plant
        self.cartManager = cartManager
    }

    // MARK: - Accessors
    
    var plantName: String {
        plant.plantInfo.commonName
    }
    
    var plantPrice: String {
        "$\(plant.price)"
    }
    
    var plantImageURLString: String {
        plant.imageURL
    }

    // MARK: - Methods

    func addToCart() {
        cartManager.addToCart(product: plant)
    }
}
