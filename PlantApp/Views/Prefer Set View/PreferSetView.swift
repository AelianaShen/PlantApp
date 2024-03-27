//
//  PreferSetView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/5/23.
//

import SwiftUI

struct PreferSetView: View {
    @StateObject var viewModel = PreferSetViewModel()
    @StateObject var questionManager = QuestionManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                plantDevImage
                guideline
                startQuestionsButton
            }
            .padding(.horizontal, 40)
        }
    }
    
    private var plantDevImage: some View {
        Image("plant_dev_icon")
    }
    
    private var guideline: some View {
        Text(viewModel.guidelineString)
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
    }
    
    private var startQuestionsButton: some View {
        NavigationLink {
            QuestionView(questionManager: questionManager, viewModel: QuestionViewModel(questionManager: questionManager))
        } label: {
            PrimaryButton(text: viewModel.primaryButtonString)
        }
    }
}

struct PreferSetView_Previews: PreviewProvider {
    static var previews: some View {
        PreferSetView()
    }
}
