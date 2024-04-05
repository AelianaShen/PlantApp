//
//  QuestionManager.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/10/23.
//

import Foundation

@Observable class QuestionManager: QuestionManaging {
    private(set) var index = 0
    private(set) var answerChoices: [String] = []
    private(set) var reachedEnd = false
    private(set) var reachedFront = true
    private(set) var question: Question?
    private let questionsIterator = Iterator(for: questions)
    private let userPreferencesStore: UserPreferencesStore
    
    init(userPreferencesStore: UserPreferencesStore = UserPreferencesStoreImpl()) {
        self.userPreferencesStore = userPreferencesStore
        self.question = questionsIterator.next()
        initializeAnswers()
    }
    
    func initializeAnswers () {
        var answers = Array.init(repeating: "", count: questionsIterator.count)
        
        let careLevel = userPreferencesStore.careLevel
        let maintenanceLevel = userPreferencesStore.maintenanceLevel
        let colorScheme = userPreferencesStore.colorScheme
        let productiveOrDecorative = userPreferencesStore.productiveOrDecorative
        let leafStyle = userPreferencesStore.leafStyle
        let petFriendly = userPreferencesStore.petFriendly
        
        if let careLevel { answers[0] = careLevel.rawValue }
        if let maintenanceLevel { answers[1] = maintenanceLevel.rawValue }
        if let colorScheme { answers[2] = colorScheme.rawValue }
        if let productiveOrDecorative { answers[3] = productiveOrDecorative.rawValue }
        if let leafStyle { answers[4] = leafStyle.rawValue }
        if let petFriendly { answers[5] = petFriendly.rawValue }
        
        answerChoices = answers
    }
    
    func select(answer: String) {
        answerChoices[index] = answer
        print(answerChoices)
    }
    
    func unselectAnswer() {
        answerChoices[index] = ""
        print(answerChoices)
    }
    
    func goToNextQuestion() {
        self.question = questionsIterator.next()
        self.index += 1
        updateReachedFrontAndEnd()
    }
    
    func goToPreviousQuestion() {
        self.question = questionsIterator.previous()
        self.index -= 1
        updateReachedFrontAndEnd()
    }
    
    func skipQuestion() {
        unselectAnswer()
        goToNextQuestion()
    }
    
    func updateReachedFrontAndEnd(){
        self.reachedEnd = (questionsIterator.currentIndex == questionsIterator.count)
        self.reachedFront = (questionsIterator.currentIndex == 1)
    }
}
