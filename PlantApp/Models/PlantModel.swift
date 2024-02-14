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
    let careTips: String
    let benefits: String
}

extension Plant {
    init(from plantProduct: PlantProduct) {
        self.commonName = plantProduct.plantInfo.commonName
        self.scientificName = plantProduct.plantInfo.scientificName
        self.description = plantProduct.plantInfo.description
        self.price = String(plantProduct.price)
        self.image = plantProduct.imgUrl
        self.careTips = plantProduct.plantInfo.careTips
        self.benefits = plantProduct.plantInfo.benefits
    }
}

func convertJSON(resJson: ResponseJson) -> [Plant] {
    resJson.Items.map(Plant.init)
}


var plantList = [
    Plant(
        commonName: "Dwarf Fiddle-Leaf Fig",
        scientificName: "Ficus lyrata 'Bambino'",
        price: "28",
        image: "https://osu-software-innovation-plants-2d-img.s3.us-west-2.amazonaws.com/dwarf_fiddle_leaf_fig.png", //"plant_2",
        description: "Mini Fiddle-Leaf Fig or scientifically known as Ficus lyrata 'Bambino,' is a smaller and more compact version of the popular Fiddle-Leaf Fig (Ficus lyrata).",
        careTips: "Light: Like the regular Fiddle-Leaf Fig, the Dwarf Fiddle-Leaf Fig thrives in bright, indirect light. It can tolerate some direct sunlight but should be protected from harsh, intense rays. Watering: Allow the top inch (2.5 centimeters) of the soil to dry out before watering. Ficus plants, including the Dwarf Fiddle-Leaf Fig, are sensitive to overwatering, which can lead to root rot. Temperature: These plants prefer average room temperatures between 65-75°F (18-24°C). They do not tolerate sudden temperature drops or drafts well. Humidity: Fiddle-Leaf Figs appreciate higher humidity levels. You can increase humidity by misting the leaves or using a humidity tray. Fertilizing: Feed your Dwarf Fiddle-Leaf Fig with a balanced liquid fertilizer every 4-6 weeks during the growing season (spring and summer). Reduce fertilization during the dormant winter months. Potting and Repotting: Repot your plant when it becomes root-bound or outgrows its pot. Choose a slightly larger container with well-draining soil.",
        benefits: "The Dwarf Fiddle-Leaf Fig, like its larger counterpart, can help improve indoor air quality by filtering out pollutants.Its attractive adds a touch of elegance and style to interior spaces."
    ),
    Plant(
        commonName: "Swiss cheese plant",
        scientificName: "Monstera deliciosa",
        price: "42",
        image: "https://osu-software-innovation-plants-2d-img.s3.us-west-2.amazonaws.com/swiss_cheese.png",
        description: "The Swiss Cheese Plant, scientifically known as Monstera deliciosa, is a striking and popular indoor houseplant known for its large, uniquely shaped leaves. It is also sometimes referred to as the Split Leaf Philodendron, although it's not a true Philodendron. The Swiss Cheese Plant is characterized by its large, deeply lobed, and perforated leaves that resemble Swiss cheese, hence the common name.",
        careTips: "Light: Swiss Cheese Plants thrive in bright, indirect light. They can tolerate some dappled sunlight but should be protected from harsh, direct sun, which can scorch their leaves. Watering: Allow the top inch (2.5 centimeters) of the soil to dry out before watering. These plants prefer evenly moist soil but do not like to sit in water. Temperature: Maintain average room temperatures between 65-75°F (18-24°C). They can tolerate slightly cooler temperatures but should be protected from drafts and sudden temperature drops. Humidity: Swiss Cheese Plants appreciate higher humidity levels. Regular misting or using a humidifier can be beneficial, especially in dry indoor environments. Fertilizing: Feed your Monstera with a balanced liquid fertilizer every 2-4 weeks during the growing season (spring and summer). Reduce fertilization during the dormant fall and winter months. Support: As the plant matures, it may benefit from some support for its sprawling growth. You can use stakes or trellises to help it climb. Pruning: Pruning can help control the size and shape of the plant. Trim back leggy growth or damaged leaves as needed.",
        benefits: "Swiss Cheese Plants are known for their air-purifying qualities, which can help improve indoor air quality by removing pollutants. They make a bold and attractive statement in interior spaces with their unique foliage."
    ),
    Plant(
        commonName: "Golden Pothos",
        scientificName: "Epipremnum aureum",
        price: "32",
        image: "https://osu-software-innovation-plants-2d-img.s3.us-west-2.amazonaws.com/golden_pothos.png", //"plant_1",
        description: "The Money Plant, scientifically known as Epipremnum aureum but often referred to as Pothos, is one of the most popular and easy-to-care-for indoor plants. It is known for its attractive trailing vines with heart-shaped green leaves, which make it a favorite choice for homes and offices.",
        careTips: "Light: Money Plants thrive in indirect, bright light but can tolerate low-light conditions. Avoid direct sunlight, as it can scorch the leaves. Watering: Allow the top inch or so of the soil to dry out between waterings. Overwatering can lead to root rot, so it's essential to let the soil dry moderately between watering sessions. Temperature: These plants prefer average room temperatures between 65-85°F (18-30°C). They can tolerate slightly cooler temperatures but are sensitive to frost. Humidity: They can adapt to various humidity levels but appreciate occasional misting or placement near a humidifier, especially in dry indoor environments. Fertilizing: Feed your Money Plant with a balanced liquid fertilizer every 4-6 weeks during the growing season (spring and summer). Reduce fertilization during the dormant winter months. Potting and Repotting: Repot your Money Plant when it becomes root-bound or outgrows its pot. Spring is an ideal time for repotting. Use a well-draining potting mix. Pruning: Prune to maintain the desired shape and size. Trimming also encourages bushier growth. Propagation: Money Plants are easy to propagate from cuttings. Simply cut a stem with a few nodes and place it in water or soil, and it will develop roots and grow into a new plant.",
        benefits: "Money Plants are known for their air-purifying qualities, removing toxins like formaldehyde and benzene from the air. They are considered a symbol of good luck and prosperity in many cultures."
    )
]
