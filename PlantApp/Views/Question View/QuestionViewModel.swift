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
    
    init(questionManager: QuestionManager) {
        self.questionManager = questionManager
    }
    
    var currentIndex: String {
        return "\(questionManager.questionsIterator.currentIndex) / 6"
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
        } else {
            questionManager.unselectAnswer()
        }
    }
}
