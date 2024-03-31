//
//  CartManaging.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/30/24.
//

import Foundation

protocol CartManaging {
    var products: [Plant] { get }
    var total: Int { get }
    
    func addToCart(product: Plant)
    func removeFromCart(product: Plant)
}
