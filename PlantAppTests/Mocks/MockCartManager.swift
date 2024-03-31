//
//  MockCartManager.swift
//  PlantAppTests
//
//  Created by Aeliana Shen on 3/30/24.
//

import Foundation
@testable import PlantApp

class MockCartManager: CartManaging {
    private(set) var products: [Plant]
    private(set) var total: Int

    init(products: [Plant], total: Int) {
        self.products = products
        self.total = total
    }

    func addToCart(product: Plant) {
        products.append(product)
        total += Int(product.price)
    }

    func removeFromCart(product: Plant) {
        products = products.filter { $0.productID != product.productID }
        total -= Int(product.price)
    }
}
