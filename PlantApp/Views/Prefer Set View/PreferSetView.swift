//
//  PreferSetView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/5/23.
//

import SwiftUI

struct PreferSetView: View {
    let viewModel: PreferSetViewModel
    
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
            QuestionView(viewModel: QuestionViewModel(questionManager: viewModel.questionManager))
        } label: {
            PrimaryButton(text: viewModel.primaryButtonString)
        }
    }
}

#Preview {
    PreferSetView(viewModel: PreferSetViewModel())
}
