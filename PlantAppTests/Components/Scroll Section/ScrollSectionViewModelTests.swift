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
        let viewModel = ScrollSectionViewModel(plantServiceImp: MockSuccessPlantService(), cartManager: MockCartManager(products: [], total: 0))
        
        // When
        viewModel.plantList = []
        viewModel.isLoadingPlantList = false
        
        // Then
        XCTAssertTrue(viewModel.shouldShowEmptyListLabel)
    }
    
    func test_shouldShowEmptyListLabel_is_false_when_isLoadingPlantList() {
        // Given
        let viewModel = ScrollSectionViewModel(plantServiceImp: MockSuccessPlantService(), cartManager: MockCartManager(products: [], total: 0))
        
        // When
        viewModel.plantList = []
        viewModel.isLoadingPlantList = true
        
        // Then
        XCTAssertFalse(viewModel.shouldShowEmptyListLabel)
    }
    
    func test_shouldShowEmptyListLabel_is_false_when_plantList_not_empty() {
        // Given
        let viewModel = ScrollSectionViewModel(plantServiceImp: MockSuccessPlantService(), cartManager: MockCartManager(products: [], total: 0))
        
        // When
        viewModel.plantList = Plant.localPlantList
        viewModel.isLoadingPlantList = false
        
        // Then
        XCTAssertFalse(viewModel.shouldShowEmptyListLabel)
    }
    
    func test_shouldShowEmptyListLabel_is_false_when_plantList_not_empty_and_isLoadingPlantList() {
        // Given
        let viewModel = ScrollSectionViewModel(
            plantServiceImp: MockSuccessPlantService(),
            cartManager: MockCartManager(products: [], total: 0)
        )
        
        // When
        viewModel.plantList = Plant.localPlantList
        viewModel.isLoadingPlantList = true
        
        // Then
        XCTAssertFalse(viewModel.shouldShowEmptyListLabel)
    }
    
    func test_getPlantList() async {
        // Given
        let viewModel = ScrollSectionViewModel(
            plantServiceImp: MockSuccessPlantService(),
            cartManager: MockCartManager(products: [], total: 0)
        )
        
        // When
        await viewModel.getPlantList()
        
        // Then
        XCTAssertFalse(viewModel.plantList.isEmpty)
        XCTAssertFalse(viewModel.isLoadingPlantList)
    }
    
    func test_getPlantList_bad_url_failure() async {
        // Given
        let viewModel = ScrollSectionViewModel(
            plantServiceImp: MockBadUrlFailurePlantService(),
            cartManager: MockCartManager(products: [], total: 0)
        )
        
        // When
        await viewModel.getPlantList()
        
        // Then
        XCTAssert(viewModel.plantList.isEmpty)
        XCTAssertFalse(viewModel.isLoadingPlantList)
    }
    
    func test_getPlantList_bad_server_response_failure() async {
        // Given
        let viewModel = ScrollSectionViewModel(
            plantServiceImp: MockBadServerResponseFailurePlantService(),
            cartManager: MockCartManager(products: [], total: 0)
        )
        
        // When
        await viewModel.getPlantList()
        
        // Then
        XCTAssert(viewModel.plantList.isEmpty)
        XCTAssertFalse(viewModel.isLoadingPlantList)
    }
    
    func test_getPlantList_cannot_decode_content_data_failure() async {
        // Given
        let viewModel = ScrollSectionViewModel(
            plantServiceImp: MockCannotDecodeContentDataFailurePlantService(),
            cartManager: MockCartManager(products: [], total: 0)
        )
        
        // When
        await viewModel.getPlantList()
        
        // Then
        XCTAssert(viewModel.plantList.isEmpty)
        XCTAssertFalse(viewModel.isLoadingPlantList)
    }
    
    func test_getPlantList_connection_lost_failure() async {
        // Given
        let viewModel = ScrollSectionViewModel(
            plantServiceImp: MockGeneralFailurePlantService(),
            cartManager: MockCartManager(products: [], total: 0)
        )
        
        // When
        await viewModel.getPlantList()
        
        // Then
        XCTAssert(viewModel.plantList.isEmpty)
        XCTAssertFalse(viewModel.isLoadingPlantList)
    }
}
