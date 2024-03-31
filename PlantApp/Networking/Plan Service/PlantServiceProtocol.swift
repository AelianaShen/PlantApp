//
//  PlantServiceProtocol.swift
//  PlantApp
//
//  Created by Ziad on 2024-03-31.
//

import Foundation

protocol PlantServiceProtocol {
    func getPlants() async -> [Plant]
    func getPlant(withId plantId: String) async -> Plant?
}
