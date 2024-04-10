//
//  PrimaryButtonTests.swift
//  PlantAppTests
//
//  Created by Aeliana Shen on 4/10/24.
//

import XCTest
@testable import PlantApp

class PrimaryButtonTests: XCTestCase {
    
    func testPrimaryButton() {
        let text = "Test Button"
        let primaryButton = PrimaryButton(text: text)
        
        let getText = primaryButton.text
        
        XCTAssertEqual(getText, "Test Button")
    }
}
