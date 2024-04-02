//
//  ScrollSectionViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/15/24.
//

import Foundation
import SwiftUI

@Observable class ScrollSectionViewModel {
    private let plantServiceImp: PlantService
    let cartManager: CartManaging

    var plantList: [Plant] = []
    var isLoadingPlantList = false
    
    let sectionHeaderString = "Recommended list for you"
    let emptyListString = "The recommended list has no data."
    
    var shouldShowEmptyListLabel: Bool {
        plantList.isEmpty && !isLoadingPlantList
    }

    init(plantServiceImp: PlantService, cartManager: CartManaging) {
        self.plantServiceImp = plantServiceImp
        self.cartManager = cartManager
    }

    func getPlantList() async {
        isLoadingPlantList = true
        if plantList.isEmpty {
            plantList = await plantServiceImp.getPlants()
        }
        isLoadingPlantList = false
    }
}
