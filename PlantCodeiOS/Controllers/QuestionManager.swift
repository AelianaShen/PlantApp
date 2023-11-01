//
//  QuestionManager.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/10/23.
//

import Foundation

class QuestionManager: ObservableObject {
//    private var questionList: [Question] = questionData
    @Published private(set) var length : Int = 0
    @Published private(set) var index: Int = 0
    @Published private(set) var question: Question?
    @Published private(set) var answerChoices: Dictionary = [0:"",1:"",2:"",3:"",4:"",5:""]
    @Published private(set) var reachedEnd: Bool = false
    @Published private(set) var reachedFront: Bool = true
    
    init() {
//        Task.init {
//            await readQuestionData()
            self.length = questionData.count
            self.index = 0
            self.question = questionData[0]
            self.answerChoices = [0:"",1:"",2:"",3:"",4:"",5:""]
            self.reachedEnd = false
            self.reachedFront = true
//        }
    }
    
    func readQuestionData() async {
        self.length = questionData.count
        self.index = 0
        self.question = questionData[0]
        self.answerChoices = [0:"",1:"",2:"",3:"",4:"",5:""]
        self.reachedEnd = false
        self.reachedFront = true
    }
    
    func selectAnswer(ans: String) {
        answerChoices[index] = ans
        print(answerChoices)
    }
    
    func unselectAnswer(){
        answerChoices[index] = ""
        print(answerChoices)
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
            if index + 1 == length {
                reachedEnd = true
            } else {
                reachedEnd = false
                reachedFront = false
            }
        }
    }
    
    func goToPreQuestion() {
        if index - 1 > -1 {
            index -= 1
            setQuestion()
            if index - 1 == -1 {
                reachedFront = true
            } else {
                reachedFront = false
                reachedEnd = false
            }
        }
    }
    
    func skipQuestion() {
        unselectAnswer()
        goToNextQuestion()
    }
    
    func setQuestion(){
        if index < length {
            question = questionData[index]
        }
    }
}
