//
//  CartButtonViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/20/24.
//

import Foundation
import SwiftUI

class CartButtonViewModel: ObservableObject {
    @Published var numOfProducts: Int
    
    init(numOfProducts: Int) {
        self.numOfProducts = numOfProducts
    }
}
