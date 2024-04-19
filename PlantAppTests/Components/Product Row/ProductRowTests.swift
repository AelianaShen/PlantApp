//
//  ProductRowTests.swift
//  PlantAppTests
//
//  Created by Aeliana Shen on 4/10/24.
//

import XCTest
@testable import PlantApp // Replace YourAppName with the actual name of your app

class ProductRowTests: XCTestCase {
    
    func testProductRowCommonName() {
        // Given
        let mockPlant = Plant.localPlantList[0]
        let viewModel = ProductRowViewModel(plant: mockPlant)
        let productRow = ProductRow(viewModel: viewModel, onDelete: {})
        
        // When
        let productRowCommonName = productRow.viewModel.commonName
        
        // Then
        XCTAssertEqual(productRowCommonName, "Golden Pothos")
    }
    
    func testProductRowImageURL() {
        // Given
        let mockPlant = Plant.localPlantList[0]
        let viewModel = ProductRowViewModel(plant: mockPlant)
        let productRow = ProductRow(viewModel: viewModel, onDelete: {})
        
        // When
        let productRowImageURL = productRow.viewModel.imageURL
        
        // Then
        XCTAssertEqual(productRowImageURL?.absoluteString, "https://osu-software-innovation-plants-2d-img.s3.us-west-2.amazonaws.com/golden_pothos.png")
    }
    
    func testProductRowPrice() {
        // Given
        let mockPlant = Plant.localPlantList[0]
        let viewModel = ProductRowViewModel(plant: mockPlant)
        let productRow = ProductRow(viewModel: viewModel, onDelete: {})
        
        // When
        let productRowPrice = productRow.viewModel.price
        
        // Then
        XCTAssertEqual(productRowPrice, "$32")
    }
}
