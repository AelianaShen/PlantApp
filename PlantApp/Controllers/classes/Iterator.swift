//
//  Iterator.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 11/5/23.
//

import Foundation
class Iterator: IteratorProtocol {
    private let questions: [Question]
    private(set) var currentIndex = 0
    private(set) var count = 0
    
    init(for questions: [Question]) {
        self.questions = questions
        self.count = questions.count
    }
    
    func next() -> Question? {
        guard currentIndex < questions.count else { return nil }
        let question = questions[currentIndex]
        currentIndex += 1
        return question
    }
    
    func previous() -> Question? {
        guard currentIndex > 0 else { return nil }
        currentIndex -= 1
        let question = questions[currentIndex-1]
        return question
    }
    
    func reset() {
        currentIndex = 0
    }
}


