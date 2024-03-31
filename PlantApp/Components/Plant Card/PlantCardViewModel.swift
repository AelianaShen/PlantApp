//
//  PlantCardViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/20/24.
//

import Foundation
import SwiftUI

class PlantCardViewModel {
    private let plant: Plant
    private let cartManager: CartManaging
    
    init(plant: Plant, cartManager: CartManaging) {
        self.plant = plant
        self.cartManager = cartManager
    }
    
    var plantName: String {
        plant.plantInfo.commonName
    }
    
    var plantPrice: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .none
        if let formattedNumber = numberFormatter.string(from: NSNumber(value: plant.price)) {
            return "$\(formattedNumber)"
        } else {
            return "NaN"
        }
    }
    
    var plantImageURL: String {
        plant.imageURL
    }
    
    func addToCart() {
        cartManager.addToCart(product: plant)
    }
}
