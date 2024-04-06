//
//  QuestionViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI

class QuestionViewModel {
    private let questionManager: QuestionManager
    private var userPreferencesStore: UserPreferencesStore
    
    init(questionManager: QuestionManager, userPreferencesStore: UserPreferencesStore = UserPreferencesStoreImpl()) {
        self.questionManager = questionManager
        self.userPreferencesStore = userPreferencesStore
    }
    
    var index: Int {
        questionManager.index + 1
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
            userPreferencesStore.careLevel = UserPreferences.CareLevel(rawValue: option)
        } else if index == 2 {
            userPreferencesStore.maintenanceLevel = UserPreferences.MaintenanceLevel(rawValue: option)
        } else if index == 3 {
            userPreferencesStore.colorScheme = UserPreferences.ColorScheme(rawValue: option)
        } else if index == 4 {
            userPreferencesStore.productiveOrDecorative = UserPreferences.ProductiveOrDecorative(rawValue: option)
        } else if index == 5 {
            userPreferencesStore.leafStyle = UserPreferences.LeafStyle(rawValue: option)
        } else if index == 6 {
            userPreferencesStore.petFriendly = UserPreferences.PetFriendly(rawValue: option)
        }
    }
    
    func userUnsetPreference() {
        if index == 1 {
            userPreferencesStore.careLevel = nil
        } else if index == 2 {
            userPreferencesStore.maintenanceLevel = nil
        } else if index == 3 {
            userPreferencesStore.colorScheme = nil
        } else if index == 4 {
            userPreferencesStore.productiveOrDecorative = nil
        } else if index == 5 {
            userPreferencesStore.leafStyle = nil
        } else if index == 6 {
            userPreferencesStore.petFriendly = nil
        }
    }
}
