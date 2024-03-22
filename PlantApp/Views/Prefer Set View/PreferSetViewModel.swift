//
//  PreferSetViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI

class PreferSetViewModel: ObservableObject {
    @Published var questionManager: QuestionManager
    
    let guidelineString = "Follow the discovery story to find your optimal choice"
    let primaryButtonString = "Set My Preference"
    
    init(questionManager: QuestionManager = QuestionManager()) {
        self.questionManager = questionManager
    }
}
