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
            userPreferences.setCareLevel(option: option)
        } else if index == 2 {
            userPreferences.setMaintenanceLevel(option: option)
        } else if index == 3 {
            userPreferences.setColorScheme(option: option)
        } else if index == 4 {
            userPreferences.setProductiveOrDecorative(option: option)
        } else if index == 5 {
            userPreferences.setLeafStyle(option: option)
        } else if index == 6 {
            userPreferences.setPetFriendly(option: option)
        }
    }
    
    func userUnsetPreference() {
        if index == 1 {
            userPreferences.setCareLevel(option: nil)
        } else if index == 2 {
            userPreferences.setMaintenanceLevel(option: nil)
        } else if index == 3 {
            userPreferences.setColorScheme(option: nil)
        } else if index == 4 {
            userPreferences.setProductiveOrDecorative(option: nil)
        } else if index == 5 {
            userPreferences.setLeafStyle(option: nil)
        } else if index == 6 {
            userPreferences.setPetFriendly(option: nil)
        }
    }
}
