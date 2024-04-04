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
    let questionsIterator = Iterator(for: questions)
    private let userPreferences: UserPreferencesStore
    
    init(userPreferences: UserPreferencesStore = UserPreferencesStoreImpl()) {
        self.userPreferences = userPreferences
        self.question = questionsIterator.next()
        initializeAnswers()
    }
    
    func initializeAnswers () {
        var ans = Array.init(repeating: "", count: questionsIterator.count)
        
        let careLevel = userPreferences.careLevel
        let maintenanceLevel = userPreferences.maintenanceLevel
        let colorScheme = userPreferences.colorScheme
        let productiveOrDecorative = userPreferences.productiveOrDecorative
        let leafStyle = userPreferences.leafStyle
        let petFriendly = userPreferences.petFriendly
        
        if let careLevel { ans[0] = careLevel }
        if let maintenanceLevel { ans[1] = maintenanceLevel }
        if let colorScheme { ans[2] = colorScheme }
        if let productiveOrDecorative { ans[3] = productiveOrDecorative }
        if let leafStyle { ans[4] = leafStyle }
        if let petFriendly { ans[5] = petFriendly }
        
        answerChoices = ans
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
