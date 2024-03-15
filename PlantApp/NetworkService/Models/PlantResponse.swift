//
//  PlantResponse.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/12/24.
//

import Foundation

struct PlantResponse: Codable {
    let plant: Plant

    enum CodingKeys: String, CodingKey {
        case plant = "Item"
    }
}
