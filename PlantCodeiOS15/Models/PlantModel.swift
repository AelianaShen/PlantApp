//
//  PlantModel.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import Foundation

struct Plant: Identifiable {
    let id = UUID()
    let commonName: String
    let scientificName: String
    let price: String
    let image: String
    let description: String
}

extension Plant {
    init(from plantProduct: PlantProduct) {
        self.commonName = plantProduct.plantInfo.commonName
        self.scientificName = plantProduct.plantInfo.scientificName
        self.description = plantProduct.plantInfo.description
        self.price = String(plantProduct.price)
        self.image = plantProduct.imgUrl
    }
}

func convertJSON(resJson: ResponseJson) -> [Plant] {
    resJson.Items.map(Plant.init)
}


var plantList = [
    Plant(
        commonName: "Swiss",
        scientificName: "Monstera deliciosa",
        price: "26",
        image: "plant_1",
        description: "Monstera is a genus of 59 species of flowering plants in the arum family, Araceae, native to tropical regions of the Americas."
    ),
    Plant(
        commonName: "Ficus",
        scientificName: "Ficus carica",
        price: "20",
        image: "plant_2",
        description: "There are a number of Ficus elastica varieties grown successfully indoors which includes, “the most common one” Ficus elastica decora (has shiny leather type leaves which grow to a foot long), F.elastica robusta (has larger leaves than decora), F.elastica black prince or burgundy (has near black reddish leaves) and a selection of variegated types. \n \n How it looks and displaying: The rubber plant is all about having a small tree indoors with broad shiny attractive leaves. When this plant is about 1 – 2ft tall it’s well suited sitting as a centrepiece on a table, on a shelf, or on a windowsill, but once it begins to grow above 3ft it looks great standing next to a fireplace, television area or near door entrances (as longs as their are no cold drafts). \n \n I prefer the decora which has plain green leaves, but others like other leaf color variations and there is a nice choice. \n \n Once the plant begins to mature and grow in height it’s common to train and support the trunk and branches by staking or tying them back to keep them growing upright."
    ),
    Plant(
        commonName: "Areca Palm",
        scientificName: "Dypsis lutescens",
        price: "23",
        image: "plant_3",
        description: "Dypsis lutescens, also known as golden cane palm, areca palm, yellow palm, butterfly palm, or bamboo palm, is a species of flowering plant in the family Arecaceae, native to Madagascar and naturalized ..."
    )
]
