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
        self.index = questionsIterator.currentIndex
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
}
