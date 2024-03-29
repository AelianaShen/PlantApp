//
//  ScrollSectionViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/15/24.
//

import Foundation
import SwiftUI

@Observable class ScrollSectionViewModel {
    private let plantService: PlantServiceProtocol

    var showingError = false
    var plantList: [Plant] = []
    var isLoadingPlantList = false
    
    let sectionHeaderString = "Recommended list for you"
    let emptyListString = "The recommended list has no data."
    let alertTitleString = "Load the local plant list?"
    let alertButtonString = "OK"
    private(set) var alertBodyString = "Problems occurred when loading the recommended list from the internet. Click OK to load the local plant list. \n\n Error:"
    
    var plantListFetchFailed: Binding<Bool> {
        Binding(
            get: { self.showingError },
            set: { self.showingError = $0 }
        )
    }
    
    var shouldShowEmptyListLabel: Bool {
        plantList.isEmpty && !isLoadingPlantList
    }

    init(plantService: PlantServiceProtocol) {
        self.plantService = plantService
    }

    func getPlantList() async {
        isLoadingPlantList = true
        if plantList.isEmpty {
            plantList = await plantService.getPlants()
        }
        isLoadingPlantList = false
    }
}
