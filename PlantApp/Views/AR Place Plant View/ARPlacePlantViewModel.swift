//
//  ARPlacePlantViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation

class ARPlacePlantViewModel: ObservableObject {
    var plant: String
    @Published var isLoadingPlantModel: Bool
    @Published var progressNumber: Double = 0.0
    private let downloadManager: DownloadManager
    
    let guidelineString = "Simply touch the screen to add the plant to your home!"
    
    init(plant: String) {
        self.plant = plant
        self.isLoadingPlantModel = true
        self.downloadManager = DownloadManager()
    }
    
    func downloadPlantModel() async {
        let downloadURL = URL(string: "https://osu-software-innovation-plants-3d-model.s3.us-west-2.amazonaws.com/\(plant).usdz")!
        
        do {
            try await downloadManager.downloadFileAsync(url: downloadURL, plant: plant) { progress in
                self.progressNumber = progress
                print(progress)
            }
            DispatchQueue.main.async {
                self.isLoadingPlantModel = false
            }
        } catch {
            print("Download interrupted")
            DispatchQueue.main.async {
                self.isLoadingPlantModel = false
            }
        }
    }
}
