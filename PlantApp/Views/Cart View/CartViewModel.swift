//
//  CartViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/21/24.
//

import Foundation
import SwiftUI

@Observable class CartViewModel {
    let totalTitleString = "Your cart total is"
    let emptyString = "Your cart is empty"
    let navigationTitleString = "My Cart"
    let cartManager: CartManaging
    
    init(cartManager: CartManaging) {
        self.cartManager = cartManager
    }
    
    var cartTotal: String {
        "$\(cartManager.total).00"
    }
    
    var isEmpty: Bool {
        cartManager.products.isEmpty
    }
    
    var cartProducts: [Plant] {
        cartManager.products
    }
    
    func removeFromCart(product: Plant) {
        cartManager.removeFromCart(product: product)
    }
}
