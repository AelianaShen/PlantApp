//
//  MockQuestionManager.swift
//  PlantAppTests
//
//  Created by Aeliana Shen on 3/30/24.
//

import Foundation
@testable import PlantApp

class QuestionManager: QuestionManaging {
   private(set) var index = 0
   private(set) var answerChoices: [String]
   private(set) var reachedEnd = false
   private(set) var reachedFront = true
   private(set) var question: Question?
   private let questionsIterator = Iterator(for: questions)

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
