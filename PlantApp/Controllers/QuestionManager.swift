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
    private let userPreferences: UserPreferences
    
    init(userPreferences: UserPreferences = UserPreferencesImpl()) {
        self.userPreferences = userPreferences
        self.question = questionsIterator.next()
        initializeAnswers()
    }
    
    func initializeAnswers () {
        var ans = Array.init(repeating: "", count: questionsIterator.count)
        
        let care_level = userPreferences.care_level
        let maintenance_level = userPreferences.maintenance_level
        let color_scheme = userPreferences.color_scheme
        let productive_or_decorative = userPreferences.productive_or_decorative
        let leaf_style = userPreferences.leaf_style
        let pet_friendly = userPreferences.pet_friendly
        
        if let care_level { ans[0] = care_level }
        if let maintenance_level { ans[1] = maintenance_level }
        if let color_scheme { ans[2] = color_scheme }
        if let productive_or_decorative { ans[3] = productive_or_decorative }
        if let leaf_style { ans[4] = leaf_style }
        if let pet_friendly { ans[5] = pet_friendly }
        
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
