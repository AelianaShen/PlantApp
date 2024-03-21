//
//  AnswerRowViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/20/24.
//

import Foundation
import SwiftUI

class AnswerRowViewModel: ObservableObject {
    @Published var text: String
    @Published var isSelected: Bool
    
    init(text: String, isSelected: Bool) {
        self.text = text
        self.isSelected = isSelected
    }
}
