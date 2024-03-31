//
//  ShopViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/21/24.
//

import Foundation
import SwiftUI

@Observable class ShopViewModel {
    var searchText: String = ""
    let cartManager: CartManaging
    
    var searchTextBinding: Binding<String> {
        Binding(
            get: { self.searchText },
            set: { self.searchText = $0 }
        )
    }
    
    init(cartManager: CartManaging) {
        self.cartManager = cartManager
    }
}
