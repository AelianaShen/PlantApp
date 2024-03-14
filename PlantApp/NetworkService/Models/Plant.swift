//
//  Plant.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/12/24.
//

import Foundation

struct Plant: Codable {
    let size: Size
    let plantInfo: PlantInfo
    let petToxicity: [String]
    let productiveOrDecorative, leafStyle, productColor, careLevel: String
    let status: String
    let waterLevel: [Int]
    let productID, modelURL: String
    let lightLevel: [Int]
    let imageURL: String
    let humidityLevel: [Int]
    let price: Int
    let defaultProduct: Bool
    let temperatureLevel: [Int]

    enum CodingKeys: String, CodingKey {
        case size
        case plantInfo = "plant_info"
        case petToxicity = "pet_toxicity"
        case productiveOrDecorative = "productive_or_decorative"
        case leafStyle = "leaf_style"
        case productColor = "product_color"
        case careLevel = "care_level"
        case status
        case waterLevel = "water_level"
        case productID = "product_id"
        case modelURL = "model_url"
        case lightLevel = "light_level"
        case imageURL = "img_url"
        case humidityLevel = "humidity_level"
        case price
        case defaultProduct = "default_product"
        case temperatureLevel = "temperature_level"
    }
}

extension Plant {
    struct PlantInfo: Codable {
        let benefits, description, scientificName, commonName: String
        let careTips: String

        enum CodingKeys: String, CodingKey {
            case benefits, description
            case scientificName = "scientific_name"
            case commonName = "common_name"
            case careTips = "care_tips"
        }
    }

    struct Size: Codable {
        let length, width, height: Int
    }
}

extension Plant {
    static let localPlantList = [
        Plant(size: Size(length: 8, width: 8, height: 10), plantInfo: PlantInfo(benefits: "Money Plants are known for their air-purifying qualities, removing toxins like formaldehyde and benzene from the air. They are considered a symbol of good luck and prosperity in many cultures.", description: "The Money Plant, scientifically known as Epipremnum aureum but often referred to as Pothos, is one of the most popular and easy-to-care-for indoor plants. It is known for its attractive trailing vines with heart-shaped green leaves, which make it a favorite choice for homes and offices.", scientificName: "Epipremnum aureum", commonName: "Golden Pothos", careTips: "Light: Money Plants thrive in indirect, bright light but can tolerate low-light conditions. Avoid direct sunlight, as it can scorch the leaves. Watering: Allow the top inch or so of the soil to dry out between waterings. Overwatering can lead to root rot, so it's essential to let the soil dry moderately between watering sessions. Temperature: These plants prefer average room temperatures between 65-85°F (18-30°C). They can tolerate slightly cooler temperatures but are sensitive to frost. Humidity: They can adapt to various humidity levels but appreciate occasional misting or placement near a humidifier, especially in dry indoor environments. Fertilizing: Feed your Money Plant with a balanced liquid fertilizer every 4-6 weeks during the growing season (spring and summer). Reduce fertilization during the dormant winter months. Potting and Repotting: Repot your Money Plant when it becomes root-bound or outgrows its pot. Spring is an ideal time for repotting. Use a well-draining potting mix. Pruning: Prune to maintain the desired shape and size. Trimming also encourages bushier growth. Propagation: Money Plants are easy to propagate from cuttings. Simply cut a stem with a few nodes and place it in water or soil, and it will develop roots and grow into a new plant."), petToxicity: ["Dogs","Cats"], productiveOrDecorative: "decorative", leafStyle: "dramatic", productColor: "brown", careLevel: "beginner", status: "in_stock", waterLevel: [2], productID: "100001", modelURL: "golden_pothos", lightLevel: [2,3,4], imageURL: "https://osu-software-innovation-plants-2d-img.s3.us-west-2.amazonaws.com/golden_pothos.png", humidityLevel: [2], price: 32, defaultProduct: true, temperatureLevel: [2]),
        Plant(size: Size(length: 12, width: 12, height: 20), plantInfo: PlantInfo(benefits: "The Dwarf Fiddle-Leaf Fig, like its larger counterpart, can help improve indoor air quality by filtering out pollutants.Its attractive adds a touch of elegance and style to interior spaces.", description: "Mini Fiddle-Leaf Fig or scientifically known as Ficus lyrata 'Bambino,' is a smaller and more compact version of the popular Fiddle-Leaf Fig (Ficus lyrata).", scientificName: "Ficus lyrata 'Bambino'", commonName: "Dwarf Fiddle-Leaf Fig", careTips: "Light: Like the regular Fiddle-Leaf Fig, the Dwarf Fiddle-Leaf Fig thrives in bright, indirect light. It can tolerate some direct sunlight but should be protected from harsh, intense rays. Watering: Allow the top inch (2.5 centimeters) of the soil to dry out before watering. Ficus plants, including the Dwarf Fiddle-Leaf Fig, are sensitive to overwatering, which can lead to root rot. Temperature: These plants prefer average room temperatures between 65-75°F (18-24°C). They do not tolerate sudden temperature drops or drafts well. Humidity: Fiddle-Leaf Figs appreciate higher humidity levels. You can increase humidity by misting the leaves or using a humidity tray. Fertilizing: Feed your Dwarf Fiddle-Leaf Fig with a balanced liquid fertilizer every 4-6 weeks during the growing season (spring and summer). Reduce fertilization during the dormant winter months. Potting and Repotting: Repot your plant when it becomes root-bound or outgrows its pot. Choose a slightly larger container with well-draining soil."), petToxicity: ["Dogs","Cats"], productiveOrDecorative: "decorative", leafStyle: "dramatic", productColor: "dark", careLevel: "advanced", status: "in_stock", waterLevel: [2], productID: "100002", modelURL: "dwarf_fiddle_leaf_fig", lightLevel: [2,3], imageURL: "https://osu-software-innovation-plants-2d-img.s3.us-west-2.amazonaws.com/dwarf_fiddle_leaf_fig.png", humidityLevel: [2], price: 28, defaultProduct: true, temperatureLevel: [2]),
        Plant(size: Size(length: 8, width: 8, height: 32), plantInfo: PlantInfo(benefits: "Swiss Cheese Plants are known for their air-purifying qualities, which can help improve indoor air quality by removing pollutants. They make a bold and attractive statement in interior spaces with their unique foliage.", description: "The Swiss Cheese Plant, scientifically known as Monstera deliciosa, is a striking and popular indoor houseplant known for its large, uniquely shaped leaves. It is also sometimes referred to as the Split Leaf Philodendron, although it's not a true Philodendron. The Swiss Cheese Plant is characterized by its large, deeply lobed, and perforated leaves that resemble Swiss cheese, hence the common name.", scientificName: "Monstera deliciosa", commonName: "Swiss cheese plant (split leaf philodendron)", careTips: "Light: Swiss Cheese Plants thrive in bright, indirect light. They can tolerate some dappled sunlight but should be protected from harsh, direct sun, which can scorch their leaves. Watering: Allow the top inch (2.5 centimeters) of the soil to dry out before watering. These plants prefer evenly moist soil but do not like to sit in water. Temperature: Maintain average room temperatures between 65-75°F (18-24°C). They can tolerate slightly cooler temperatures but should be protected from drafts and sudden temperature drops. Humidity: Swiss Cheese Plants appreciate higher humidity levels. Regular misting or using a humidifier can be beneficial, especially in dry indoor environments. Fertilizing: Feed your Monstera with a balanced liquid fertilizer every 2-4 weeks during the growing season (spring and summer). Reduce fertilization during the dormant fall and winter months. Support: As the plant matures, it may benefit from some support for its sprawling growth. You can use stakes or trellises to help it climb. Pruning: Pruning can help control the size and shape of the plant. Trim back leggy growth or damaged leaves as needed."), petToxicity: ["Dogs","Cats"], productiveOrDecorative: "decorative", leafStyle: "dramatic", productColor: "gray", careLevel: "beginner", status: "in_stock", waterLevel: [2], productID: "100003", modelURL: "swiss_cheese", lightLevel: [2,3,4], imageURL: "https://osu-software-innovation-plants-2d-img.s3.us-west-2.amazonaws.com/swiss_cheese.png", humidityLevel: [2], price: 42, defaultProduct: true, temperatureLevel: [2])
    ]
}
