//
//  WelcomeViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import SwiftUI

class WelcomeViewModel: ObservableObject {
    let title: String
    let description: String
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
