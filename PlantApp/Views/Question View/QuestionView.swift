//
//  QuestionView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/8/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var questionManager: QuestionManager
    @StateObject var viewModel: QuestionViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            questionDescription
            questionOptions
            skipQuestionButton

            HStack {
                if !viewModel.questionManager.reachedFront {
                    goToPreviousQuestionButton
                }
                
                Spacer()
                currentIndexLabel
                Spacer()
                
                if !viewModel.questionManager.reachedEnd {
                    goToNextQuestionButton
                }
            }
        }
        .padding(50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var questionDescription: some View {
        Text(viewModel.questionManager.question!.description)
            .multilineTextAlignment(.center)
            .padding(.bottom, 30)
            .font(.headline)
    }
    
    private var questionOptions: some View {
        ForEach(viewModel.questionManager.question!.options, id: \.self) { option in
            let selectedOption = viewModel.questionManager.answerChoices[viewModel.questionManager.index]
            let isSelected = (option == selectedOption)
            AnswerRow(viewModel: AnswerRowViewModel(text: option, isSelected: isSelected))
                .environmentObject(viewModel.questionManager)
        }
    }
    
    private var skipQuestionButton: some View {
        Text("Skip this question")
            .padding()
            .font(.caption)
            .foregroundColor(.secondary)
            .onTapGesture {
                viewModel.questionManager.skipQuestion()
            }
    }
    
    private var goToPreviousQuestionButton: some View {
        Image(systemName: "chevron.left")
            .bold()
            .onTapGesture {
                viewModel.questionManager.goToPreviousQuestion()
            }
    }
    
    private var goToNextQuestionButton: some View {
        Image(systemName: "chevron.right")
            .bold()
            .onTapGesture {
                viewModel.questionManager.goToNextQuestion()
            }
    }
    
    private var currentIndexLabel: some View {
        Text(viewModel.currentIndex + " / 6")
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(viewModel: QuestionViewModel(questionManager: QuestionManager()))
            .environmentObject(QuestionManager())
    }
}
