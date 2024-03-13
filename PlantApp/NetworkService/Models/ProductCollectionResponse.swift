//
//  ProductCollectionResponse.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/12/24.
//

import Foundation

struct ProductCollectionResponse: Codable {
    let metadata: Metadata
    let count: Int
    let plants: [Plant]
    let scannedCount: Int

    enum CodingKeys: String, CodingKey {
        case metadata = "$metadata"
        case count = "Count"
        case plants = "Items"
        case scannedCount = "ScannedCount"
    }
}

extension ProductCollectionResponse {
    struct Metadata: Codable {
        let httpStatusCode: Int
        let requestID: String
        let attempts, totalRetryDelay: Int

        enum CodingKeys: String, CodingKey {
            case httpStatusCode
            case requestID = "requestId"
            case attempts, totalRetryDelay
        }
    }
}
