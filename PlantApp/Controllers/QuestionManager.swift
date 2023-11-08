//
//  QuestionManager.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/10/23.
//

import Foundation

class QuestionManager: ObservableObject {
    @Published private(set) var index = 0
    @Published private(set) var answerChoices: [String]
    @Published private(set) var reachedEnd = false
    @Published private(set) var reachedFront = true
    @Published private(set) var question: Question?
    var questionsIterator = Iterator(for: questions)

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

