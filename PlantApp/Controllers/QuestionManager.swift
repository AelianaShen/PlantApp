//
//  QuestionManager.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/10/23.
//

import Foundation

@Observable class QuestionManager: QuestionManaging {
    private(set) var index = 0
    private(set) var answerChoices: [String]
    private(set) var reachedEnd = false
    private(set) var reachedFront = true
    private(set) var question: Question?
    let questionsIterator = Iterator(for: questions)

    init() {
        self.question = questionsIterator.next()
        self.answerChoices = Array.init(repeating: "", count: questionsIterator.count)
        initFromUserDefaults()
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
        self.index = questionsIterator.currentIndex
        self.question = questionsIterator.next()
        checkReachedFrontAndEnd()
    }
    
    func goToPreviousQuestion() {
        self.question = questionsIterator.previous()
        self.index = questionsIterator.currentIndex-1
        checkReachedFrontAndEnd()
    }
    
    func skipQuestion() {
        unselectAnswer()
        goToNextQuestion()
    }
    
    func checkReachedFrontAndEnd(){
        self.reachedEnd = (questionsIterator.currentIndex == questionsIterator.count)
        self.reachedFront = (questionsIterator.currentIndex == 1)
    }
    
    func initFromUserDefaults(){
        let userPreferData = UserDefaults.standard
        let care_level = userPreferData.string(forKey: "care_level")
        let maintenance_level = userPreferData.string(forKey: "maintenance_level")
        let color_scheme = userPreferData.string(forKey: "color_scheme")
        let productive_or_decorative = userPreferData.string(forKey: "productive_or_decorative")
        let leaf_style = userPreferData.string(forKey: "leaf_style")
        let pet_friendly = userPreferData.string(forKey: "pet_friendly")
        
        if care_level != nil { self.answerChoices[0] = care_level! }
        if maintenance_level != nil { self.answerChoices[1] = maintenance_level! }
        if color_scheme != nil { self.answerChoices[2] = color_scheme! }
        if productive_or_decorative != nil { self.answerChoices[3] = productive_or_decorative! }
        if leaf_style != nil { self.answerChoices[4] = leaf_style! }
        if pet_friendly != nil { self.answerChoices[5] = pet_friendly! }
    }
}
