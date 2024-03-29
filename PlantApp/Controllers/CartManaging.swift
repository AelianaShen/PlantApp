//
//  CartManaging.swift
//  PlantApp
//
//  Created by Ziad on 2024-03-29.
//

import Foundation

protocol CartManaging {
    var products: [Plant] { get }
    var total: Int { get }
    
    func addToCart(product: Plant)
    func removeFromCart(product: Plant)
}
