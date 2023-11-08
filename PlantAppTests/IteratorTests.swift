//
//  IteratorTests.swift
//  PlantApp
//
//  Created by Aeliana Shen on 11/5/23.
//

import XCTest
@testable import PlantApp

class IteratorTests: XCTestCase {
    var iterator: Iterator!
    
    override func setUp() {
        super.setUp()
        let questions = [
            Question(description: "Q1", options: ["A", "B", "C"]),
            Question(description: "Q2", options: ["X", "Y"]),
            Question(description: "Q3", options: ["Yes", "No"])
        ]
        iterator = Iterator(for: questions)
    }
    
    override func tearDown() {
        iterator = nil
        super.tearDown()
    }
    
    func testNext() {
        let firstQuestion = iterator.next()
        XCTAssertEqual(firstQuestion?.description, "Q1")
        
        let secondQuestion = iterator.next()
        XCTAssertEqual(secondQuestion?.description, "Q2")
        
        let thirdQuestion = iterator.next()
        XCTAssertEqual(thirdQuestion?.description, "Q3")
        
        let fourthQuestion = iterator.next()
        XCTAssertNil(fourthQuestion)
    }
    
    func testPrevious() {
        let _ = iterator.next()
        let _ = iterator.next()
        
        let thirdQuestion = iterator.previous()
        XCTAssertEqual(thirdQuestion?.description, "Q2")
        
        let secondQuestion = iterator.previous()
        XCTAssertEqual(secondQuestion?.description, "Q1")
        
        let firstQuestion = iterator.previous()
        XCTAssertNil(firstQuestion)
    }
    
    func testReset() {
        let _ = iterator.next()
        let _ = iterator.next()
        
        iterator.reset()
        XCTAssertEqual(iterator.currentIndex, 0)
    }
}

