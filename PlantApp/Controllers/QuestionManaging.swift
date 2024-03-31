//
//  QuestionManaging.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/30/24.
//

import Foundation

protocol QuestionManaging {
    var index: Int { get }
    var answerChoices: [String] { get }
    var reachedEnd: Bool { get }
    var reachedFront: Bool { get }
    var question: Question? { get }
    var questionsIterator: Iterator { get }

    func select(answer: String)
    func unselectAnswer()
    func goToNextQuestion()
    func goToPreviousQuestion()
    func skipQuestion()
    func checkReachedFrontAndEnd()
}
