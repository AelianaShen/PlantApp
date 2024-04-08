//
//  ARPlaceBoxViewModelTests.swift
//  PlantAppTests
//
//  Created by Aeliana Shen on 4/6/24.
//

import XCTest
import RealityKit
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
    
    func testSaveBoxSizeSmall() {
        // Given
        let mockUserPreferencesStore = MockUserPreferencesStore()
        let viewModel = ARPlaceBoxViewModel(userPreferences: mockUserPreferencesStore)
        viewModel.boxSize = simd_float3(0.1, 0.1, 0.1)
        
        // When
        viewModel.saveBoxSize()
        
        // Then
        XCTAssertEqual(viewModel.boxLevel, UserPreferences.BoxLevel.small)
    }
    
    func testSaveBoxSizeMedium() {
        // Given
        let viewModel = ARPlaceBoxViewModel()
        viewModel.boxSize = simd_float3(0.32, 0.32, 0.32)
        
        // When
        viewModel.saveBoxSize()
        
        // Then
        XCTAssertEqual(viewModel.boxLevel, UserPreferences.BoxLevel.medium)
    }
    
    func testSaveBoxSizeLarge() {
        // Given
        let viewModel = ARPlaceBoxViewModel()
        viewModel.boxSize = simd_float3(0.5, 0.5, 0.5)
        
        // When
        viewModel.saveBoxSize()
        
        // Then
        XCTAssertEqual(viewModel.boxLevel, UserPreferences.BoxLevel.large)
    }
    
    func testSaveBoxSizeTooSmall() {
        // Given
        let viewModel = ARPlaceBoxViewModel()
        viewModel.boxSize = simd_float3(0.09, 0.09, 0.09)
        
        // When
        viewModel.saveBoxSize()
        
        // Then
        XCTAssertEqual(viewModel.boxLevel, nil)
    }
}
