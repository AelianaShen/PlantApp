//
//  ScrollSectionViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/15/24.
//

import Foundation
import SwiftUI

@Observable class ScrollSectionViewModel{
    private let plantService = PlantService()
    var plantList: [Plant] = []
    var showingError = false
    var isLoadingPlantList = false
    
    let sectionHeaderString = "Recommended list for you"
    let emptyListString = "The recommended list has no data."
    let alertTitleString = "Load the local plant list?"
    let alertButtonString = "OK"
    var alertBodyString = "Problems occur when loading the recommended list from the internet. Click OK to load the local plant list. \n\n Error:"
    
    var plantListFetchFailed: Binding<Bool> {
        Binding(
            get: { self.showingError },
            set: { self.showingError = $0 }
        )
    }
    
    var shouldShowEmptyListLabel: Bool {
        plantList.isEmpty && !isLoadingPlantList
    }
    
    func getPlantList() async {
        isLoadingPlantList = true
        do {
            plantList = try await plantService.getPlants()
            isLoadingPlantList = false
        } catch URLError.badURL {
            showingError = true
            alertBodyString += "bad URL"
        } catch URLError.badServerResponse {
            showingError = true
            alertBodyString += "bad server response"
        } catch URLError.cannotDecodeContentData {
            showingError = true
            alertBodyString += "cannot decode content data"
        } catch {
            showingError = true
            alertBodyString += "unexpected error"
        }
    }
}
