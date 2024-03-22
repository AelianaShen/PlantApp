//
//  QuestionViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI

class QuestionViewModel: ObservableObject {
    @Published var questionManager: QuestionManager
    
    init(questionManager: QuestionManager = QuestionManager()) {
        self.questionManager = questionManager
    }
    
    var currentIndex: String {
        return "\(questionManager.questionsIterator.currentIndex)"
    }
}
