//
//  CollectionResponse.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/12/24.
//

import Foundation

struct CollectionResponse<Model: Codable>: Codable {
    let count: Int
    let items: [Model]

    enum CodingKeys: String, CodingKey {
        case count = "Count"
        case items = "Items"
    }
}
