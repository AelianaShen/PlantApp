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
    var plantList: [Plant]?
    var showingError = false
    var errorMessage = ""
    var isLoadingPlantList = false
    
    var showingErrorBinding: Binding<Bool> {
        Binding(
            get: { self.showingError },
            set: { self.showingError = $0 }
        )
    }
    
    func getPlantList() async {
        isLoadingPlantList = true
        do {
            plantList = try await plantService.getPlants()
            isLoadingPlantList = false
        } catch URLError.badURL {
            showingError = true
            errorMessage = "bad URL"
        } catch URLError.badServerResponse {
            showingError = true
            errorMessage = "bad server response"
        } catch URLError.cannotDecodeContentData {
            showingError = true
            errorMessage = "cannot decode content data"
        } catch {
            showingError = true
            errorMessage = "unexpected error"
        }
    }
}
