//
//  QuestionModel.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/9/23.
//

import Foundation

struct Question: Identifiable {
    var id = UUID()
    var description: String
    var options: [String]
    var num: Int
}

let questionData = [
    Question(
        description: "What is your level of experience with indoor plants?",
        options: [
            "beginner",
            "intermediate",
            "expert"
        ],
        num: 0
    ),
    Question(
        description: "How often are you willing to water and care for your plants?",
        options: [
            "low-maintenance",
            "more effort"
        ],
        num: 1
    ),
    Question(
        description: "Do you have a specific color scheme or aesthetic in mind for you indoor space?",
        options: [
            "complement",
            "contrast"
        ],
        num: 2
    ),
    Question(
        description: "Are you interested in plants that flower or produce fruit, or do you prefer plants that are primarily decorative?",
        options: [
            "production",
            "decoration"
        ],
        num: 3
    ),
    Question(
        description: "Do you preper plants with large, dramatic leaves or more delicate foliage?",
        options: [
            "dramatic",
            "delicate"
        ],
        num: 4
    ),
    Question(
        description: "Are you looking for pet-safe or child-friendly options?",
        options: [
            "yes",
            "no"
        ],
        num: 5
    )
]
