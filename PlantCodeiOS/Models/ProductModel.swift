//
//  ProductModel.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 10/19/23.
//

import Foundation

struct PlantInfo: Decodable {
    var commonName: String
    var scientificName: String
    var description: String
    var careTips: String
    var benefits: String
}

struct Size: Decodable {
    var height: Int
    var length: Int
    var width: Int
}

struct PlantProduct: Decodable {
    var productId: String
    var petToxicity: [String]
    var careLevel: String
    var defaultProduct: Bool
    var humidityLevel: [Int]
    var imgUrl: String
    var leafStyle: String
    var lightLevel: [Int]
    var modelUrl: String
    var plantInfo: PlantInfo
    var price: Int
    var productiveOrDecorative: String
    var productColor: String
    var size: Size
    var status: String
    var temperatureLevel: [Int]
    var waterLevel: [Int]
}

struct ResponseJson: Decodable {
    var Items: [PlantProduct]
}
