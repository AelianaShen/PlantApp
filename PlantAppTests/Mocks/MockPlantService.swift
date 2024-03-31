//
//  MockPlantService.swift
//  PlantAppTests
//
//  Created by Ziad on 2024-03-15.
//

import Foundation
@testable import PlantApp

class MockSuccessPlantService: PlantServiceProtocol {
    func getPlants() async -> [Plant] {
        return Plant.localPlantList
    }
    
    func getPlant(withId plantId: String) async -> Plant? {
        return Plant.localPlantList[0]
    }
}

class MockBadUrlFailurePlantService: PlantServiceProtocol {
    func getPlants() async -> [Plant] {
        return []
    }
    
    func getPlant(withId plantId: String) async -> Plant? {
        return nil
    }
}

class MockBadServerResponseFailurePlantService: PlantServiceProtocol {
    func getPlants() async -> [Plant] {
        return []
    }
    
    func getPlant(withId plantId: String) async -> Plant? {
        return nil
    }
}

class MockCannotDecodeContentDataFailurePlantService: PlantServiceProtocol {
    func getPlants() async -> [Plant] {
        return []
    }
    
    func getPlant(withId plantId: String) async -> Plant? {
        return nil
    }
}

class MockGeneralFailurePlantService: PlantServiceProtocol {
    func getPlants() async -> [Plant] {
        return []
    }
    
    func getPlant(withId plantId: String) async -> Plant? {
        return nil
    }
}
