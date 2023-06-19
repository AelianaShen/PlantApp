//
//  PlantModel.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import Foundation

enum Category: String {
    case succulent = "Succulent"
    case foliage = "Foliage"
    case flowering = "Flowering"
    case fern = "Fern"
    case air = "Air"
    case herb = "Herb"
    case plam = "Plam"
}

struct Plant: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let image: String
    let category: Category.RawValue
    let description: String
}

var plantList = [
    Plant(
        name: "Monstera",
        price: "26",
        image: "plant_1",
        category: "Foliage",
        description: "Monstera is a genus of 59 species of flowering plants in the arum family, Araceae, native to tropical regions of the Americas."
    ),
    Plant(
        name: "Ficus",
        price: "20",
        image: "plant_2",
        category: "Foliage",
        description: "There are a number of Ficus elastica varieties grown successfully indoors which includes, “the most common one” Ficus elastica decora (has shiny leather type leaves which grow to a foot long), F.elastica robusta (has larger leaves than decora), F.elastica black prince or burgundy (has near black reddish leaves) and a selection of variegated types. \n \n How it looks and displaying: The rubber plant is all about having a small tree indoors with broad shiny attractive leaves. When this plant is about 1 – 2ft tall it’s well suited sitting as a centrepiece on a table, on a shelf, or on a windowsill, but once it begins to grow above 3ft it looks great standing next to a fireplace, television area or near door entrances (as longs as their are no cold drafts). \n \n I prefer the decora which has plain green leaves, but others like other leaf color variations and there is a nice choice. \n \n Once the plant begins to mature and grow in height it’s common to train and support the trunk and branches by staking or tying them back to keep them growing upright."
    ),
    Plant(
        name: "Areca Palm",
        price: "23",
        image: "plant_3",
        category: "Foliage",
        description: "Dypsis lutescens, also known as golden cane palm, areca palm, yellow palm, butterfly palm, or bamboo palm, is a species of flowering plant in the family Arecaceae, native to Madagascar and naturalized ..."
    )
]
