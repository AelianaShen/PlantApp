//
//  CartViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/21/24.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    @Published var cartManager: CartManager
    
    let totalTitleString = "Your cart total is"
    let emptyString = "Your cart is empty"
    let navigationTitleString = "My Cart"
    
    init(cartManager: CartManager = CartManager()) {
        self.cartManager = cartManager
    }
    
    var cartTotal: String {
        return "$\(cartManager.total).00"
    }
    
    var isEmpty: Bool {
        return cartManager.products.isEmpty
    }
}
