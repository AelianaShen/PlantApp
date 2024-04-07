//
//  ARPlaceBoxViewModelTests.swift
//  PlantAppTests
//
//  Created by Aeliana Shen on 4/6/24.
//

import XCTest
@testable import PlantApp

final class ARPlaceBoxViewModelTests: XCTestCase {
    
    func testSaveLuxValueLow() {
        // Given
        let mockUserPreferencesStore = MockUserPreferencesStore()
        let viewModel = ARPlaceBoxViewModel(userPreferences: mockUserPreferencesStore)
        viewModel.luxValue = 25
        
        // When
        viewModel.saveLuxValue()
        
        // Then
        XCTAssertEqual(viewModel.lightLevel, UserPreferences.LightLevel.low)
    }
    
    func testSaveLuxValueMedium() {
        // Given
        let viewModel = ARPlaceBoxViewModel()
        viewModel.luxValue = 75
        
        // When
        viewModel.saveLuxValue()
        
        // Then
        XCTAssertEqual(viewModel.lightLevel, UserPreferences.LightLevel.medium)
    }
    
    func testSaveLuxValueHigh() {
        // Given
        let viewModel = ARPlaceBoxViewModel()
        viewModel.luxValue = 200
        
        // When
        viewModel.saveLuxValue()
        
        // Then
        XCTAssertEqual(viewModel.lightLevel, UserPreferences.LightLevel.high)
    }
    
    func testSaveLuxValueTooLow() {
        // Given
        let viewModel = ARPlaceBoxViewModel()
        viewModel.luxValue = 24
        
        // When
        viewModel.saveLuxValue()
        
        // Then
        XCTAssertEqual(viewModel.lightLevel, nil)
    }
}
