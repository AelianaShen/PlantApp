//
//  MockPlantService.swift
//  PlantAppTests
//
//  Created by Ziad on 2024-03-15.
//

import Foundation
@testable import PlantApp

class MockSuccessPlantService: PlantServiceProtocol {
    func getPlants() async throws -> [Plant] {
        return Plant.localPlantList
    }
}

class MockBadUrlFailurePlantService: PlantServiceProtocol {
    func getPlants() async throws -> [Plant] {
        throw URLError(.badURL)
    }
}

class MockBadServerResponseFailurePlantService: PlantServiceProtocol {
    func getPlants() async throws -> [Plant] {
        throw URLError(.badServerResponse)
    }
}

class MockCannotDecodeContentDataFailurePlantService: PlantServiceProtocol {
    func getPlants() async throws -> [Plant] {
        throw URLError(.cannotDecodeContentData)
    }
}

class MockGeneralFailurePlantService: PlantServiceProtocol {
    func getPlants() async throws -> [Plant] {
        throw URLError(.networkConnectionLost)
    }
}
