//
//  ProductCollectionResponse.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/12/24.
//

import Foundation

struct ProductCollectionResponse: Codable {
    let count: Int
    let plants: [Plant]
    let scannedCount: Int

    enum CodingKeys: String, CodingKey {
        case count = "Count"
        case plants = "Items"
        case scannedCount = "ScannedCount"
    }
}
