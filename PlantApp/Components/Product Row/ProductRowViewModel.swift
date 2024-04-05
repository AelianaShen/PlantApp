//
//  ProductRowViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/21/24.
//

import Foundation
import SwiftUI

final class ProductRowViewModel {
    private let plant: Plant
    
    init(plant: Plant) {
        self.plant = plant
    }
    
    var imageURL: URL? {
        guard let url = URL(string: plant.imageURL) else { return nil }
        return url
    }
    
    var commonName: String {
        plant.plantInfo.commonName
    }
    
    var price: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .none
        if let formattedNumber = numberFormatter.string(from: NSNumber(value: plant.price)) {
            return "$\(formattedNumber)"
        } else {
            return "NaN"
        }
    }
}
