//
//  QuestionViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI

class QuestionViewModel: ObservableObject {
    let userPreferData: UserPreferData
    let questionManager: QuestionManager
    
    init(questionManager: QuestionManager, userPreferData: UserPreferData) {
        self.questionManager = questionManager
        self.userPreferData = userPreferData
    }
    
    var index: Int {
        questionManager.questionsIterator.currentIndex
    }
    
    var currentIndex: String {
        return "\(index) / 6"
    }
    
    var questionDescription: String {
        return questionManager.question!.description
    }
    
    var questionOptions: [String] {
        return questionManager.question!.options
    }
    
    var selectedOption: String {
        return questionManager.answerChoices[questionManager.index]
    }
    
    var reachedFront: Bool {
        return questionManager.reachedFront
    }
    
    var reachedEnd: Bool {
        return questionManager.reachedEnd
    }
    
    func skipQuestion() {
        questionManager.skipQuestion()
    }
    
    func goToPreviousQuestion() {
        questionManager.goToPreviousQuestion()
    }
    
    func goToNextQuestion() {
        questionManager.goToNextQuestion()
    }
    
    func selectOption(option: String) {
        let isSelected = option == selectedOption
        if !isSelected {
            questionManager.select(answer: option)
            userSetPreference(option: option)
        } else {
            questionManager.unselectAnswer()
            userUnsetPreference()
        }
    }
    
    func userSetPreference(option: String) {
        if index == 1 {
            userPreferData.care_level = option
        } else if index == 2 {
            userPreferData.maintenance_level = option
        } else if index == 3 {
            userPreferData.color_scheme = option
        } else if index == 4 {
            userPreferData.productive_or_decorative = option
        } else if index == 5 {
            userPreferData.leaf_style = option
        } else if index == 6 {
            userPreferData.pet_friendly = option
        }
    }
    
    func userUnsetPreference() {
        if index == 1 {
            userPreferData.care_level = ""
        } else if index == 2 {
            userPreferData.maintenance_level = ""
        } else if index == 3 {
            userPreferData.color_scheme = ""
        } else if index == 4 {
            userPreferData.productive_or_decorative = ""
        } else if index == 5 {
            userPreferData.leaf_style = ""
        } else if index == 6 {
            userPreferData.pet_friendly = ""
        }
    }
}
