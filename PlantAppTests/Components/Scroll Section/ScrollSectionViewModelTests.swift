//
//  ScrollSectionViewModelTests.swift
//  PlantAppTests
//
//  Created by Aeliana Shen on 3/15/24.
//

import Foundation
import XCTest
@testable import PlantApp

class ScrollSectionViewModelTests: XCTestCase {
    
    func test_shouldShowEmptyListLabel() {
        // Given
        let viewModel = ScrollSectionViewModel()
        
        // When
        viewModel.plantList = []
        viewModel.isLoadingPlantList = false
        
        // Then
        XCTAssertTrue(viewModel.shouldShowEmptyListLabel)
    }
    
    func test_shouldShowEmptyListLabel_is_false_when_isLoadingPlantList() {
        // Given
        let viewModel = ScrollSectionViewModel()
        
        // When
        viewModel.plantList = []
        viewModel.isLoadingPlantList = true
        
        // Then
        XCTAssertFalse(viewModel.shouldShowEmptyListLabel)
    }
    
    func test_shouldShowEmptyListLabel_is_false_when_plantList_not_empty() {
        // Given
        let viewModel = ScrollSectionViewModel()
        
        // When
        viewModel.plantList = Plant.localPlantList
        viewModel.isLoadingPlantList = false
        
        // Then
        XCTAssertFalse(viewModel.shouldShowEmptyListLabel)
    }
    
    func test_shouldShowEmptyListLabel_is_false_when_plantList_not_empty_and_isLoadingPlantList() {
        // Given
        let viewModel = ScrollSectionViewModel()
        
        // When
        viewModel.plantList = Plant.localPlantList
        viewModel.isLoadingPlantList = true
        
        // Then
        XCTAssertFalse(viewModel.shouldShowEmptyListLabel)
    }
    
    func test_getPlantList() async {
        // Given
        let viewModel = ScrollSectionViewModel()
        
        // When
        await viewModel.getPlantList()
        
        // Then
        XCTAssertFalse(viewModel.plantList.isEmpty)
    }
    
    func test_getPlantList() async {
        // Given
        let viewModel = ScrollSectionViewModel()
        
        // When
        await viewModel.getPlantList()
        
        // Then
        XCTAssertFalse(viewModel.plantList.isEmpty)
    }
}
