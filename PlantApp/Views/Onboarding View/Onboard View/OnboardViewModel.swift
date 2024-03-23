//
//  OnboardViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import SwiftUI

class OnboardViewModel: ObservableObject {
    let systemImageName: String
    let title: String
    let description: String
    
    init(systemImageName: String, title: String, description: String) {
        self.systemImageName = systemImageName
        self.title = title
        self.description = description
    }
}
