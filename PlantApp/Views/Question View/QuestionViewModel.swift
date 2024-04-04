//
//  QuestionViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI

class QuestionViewModel {
    let questionManager: QuestionManager
    let userPreferences: UserPreferencesStoreImpl
    
    init(questionManager: QuestionManager, userPreferences: UserPreferencesStoreImpl = UserPreferencesStoreImpl()) {
        self.questionManager = questionManager
        self.userPreferences = userPreferences
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
            userPreferences.set_box_level(option: option)
        } else if index == 2 {
            userPreferences.set_maintenance_level(option: option)
        } else if index == 3 {
            userPreferences.set_color_scheme(option: option)
        } else if index == 4 {
            userPreferences.set_productive_or_decorative(option: option)
        } else if index == 5 {
            userPreferences.set_leaf_style(option: option)
        } else if index == 6 {
            userPreferences.set_pet_friendly(option: option)
        }
    }
    
    func userUnsetPreference() {
        if index == 1 {
            userPreferences.set_box_level(option: nil)
        } else if index == 2 {
            userPreferences.set_maintenance_level(option: nil)
        } else if index == 3 {
            userPreferences.set_color_scheme(option: nil)
        } else if index == 4 {
            userPreferences.set_productive_or_decorative(option: nil)
        } else if index == 5 {
            userPreferences.set_leaf_style(option: nil)
        } else if index == 6 {
            userPreferences.set_pet_friendly(option: nil)
        }
    }
}
