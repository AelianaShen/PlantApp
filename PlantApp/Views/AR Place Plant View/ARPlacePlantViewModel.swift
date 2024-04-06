//
//  ARPlacePlantViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI

class ARPlacePlantViewModel: ObservableObject {
    var plant: String
    let guidelineString = "Simply touch the screen to add the plant to your home!"
    
    init(plant: String) {
        self.plant = plant
    }
    
    func downloadPlantModel() async {
        let downloadManager = DownloadManager()
        let downloadURL = URL(string: "https://osu-software-innovation-plants-3d-model.s3.us-west-2.amazonaws.com/\(plant).usdz")!

        do {
            try await downloadManager.startDownload(url: downloadURL, plant: plant) { progress in
                print("Download progress: \(progress)")
            }
        } catch {
            print("Download interrupted")
        }
    }
}
