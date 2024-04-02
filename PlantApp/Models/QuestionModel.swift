//
//  QuestionModel.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/9/23.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let description: String
    let options: [String]
}

let questions = [
    Question(
        description: "What is your level of experience with indoor plants?",
        options: [
            "beginner",
            "intermediate",
            "advanced"
        ]
    ),
    Question(
        description: "How often are you willing to water and care for your plants?",
        options: [
            "low-maintenance",
            "more effort"
        ]
    ),
    Question(
        description: "Do you have a specific color scheme or aesthetic in mind for you indoor space?",
        options: [
            "complement",
            "contrast"
        ]
    ),
    Question(
        description: "Are you interested in plants that flower or produce fruit, or do you prefer plants that are primarily decorative?",
        options: [
            "production",
            "decoration"
        ]
    ),
    Question(
        description: "Do you preper plants with large, dramatic leaves or more delicate foliage?",
        options: [
            "dramatic",
            "delicate"
        ]
    ),
    Question(
        description: "Are you looking for pet-safe or child-friendly options?",
        options: [
            "yes",
            "no"
        ]
    )
]
