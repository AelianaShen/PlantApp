//
//  Response.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/12/24.
//

import Foundation

struct Response<Model: Codable>: Codable {
    let item: Model

    enum CodingKeys: String, CodingKey {
        case item = "Item"
    }
}
