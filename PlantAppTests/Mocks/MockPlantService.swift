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
    
    func getPlant(withId plantId: String) async throws -> Plant {
        return Plant.localPlantList[0]
    }
}

class MockBadUrlFailurePlantService: PlantServiceProtocol {
    func getPlants() async throws -> [Plant] {
        throw URLError(.badURL)
    }
    
    func getPlant(withId plantId: String) async throws -> Plant {
        throw URLError(.badURL)
    }
}

class MockBadServerResponseFailurePlantService: PlantServiceProtocol {
    func getPlants() async throws -> [Plant] {
        throw URLError(.badServerResponse)
    }
    
    func getPlant(withId plantId: String) async throws -> Plant {
        throw URLError(.badServerResponse)
    }
}

class MockCannotDecodeContentDataFailurePlantService: PlantServiceProtocol {
    func getPlants() async throws -> [Plant] {
        throw URLError(.cannotDecodeContentData)
    }
    
    func getPlant(withId plantId: String) async throws -> Plant {
        throw URLError(.cannotDecodeContentData)
    }
}

class MockGeneralFailurePlantService: PlantServiceProtocol {
    func getPlants() async throws -> [Plant] {
        throw URLError(.networkConnectionLost)
    }
    
    func getPlant(withId plantId: String) async throws -> Plant {
        throw URLError(.networkConnectionLost)
    }
}
