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
    @Published var questionManager: QuestionManager
    
    init(text: String, isSelected: Bool, questionManager: QuestionManager) {
        self.text = text
        self.isSelected = isSelected
        self.questionManager = questionManager
    }
}
