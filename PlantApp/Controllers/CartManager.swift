//
//  CartManager.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/18/23.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Plant] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Plant) {
        products.append(product)
        total += Int(product.price) 
    }
    
    func removeFromCart(product: Plant) {
        products = products.filter { $0.productID != product.productID }
        total -= Int(product.price) 
    }
    
}
