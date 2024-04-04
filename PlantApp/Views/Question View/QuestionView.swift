//
//  QuestionView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/8/23.
//

import SwiftUI

struct QuestionView: View {
    let viewModel: QuestionViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            questionDescription
            questionOptions
            HStack {
                if !viewModel.reachedEnd {
                    skipQuestionButton
                }
            }
            .frame(height: 50)
            
            HStack {
                if !viewModel.reachedFront {
                    goToPreviousQuestionButton
                }
                
                Spacer()
                currentIndexLabel
                Spacer()
                
                if !viewModel.reachedEnd {
                    goToNextQuestionButton
                }
            }
        }
        .padding(50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var questionDescription: some View {
        Text(viewModel.questionDescription)
            .multilineTextAlignment(.center)
            .padding(.bottom, 30)
            .font(.headline)
    }
    
    private var questionOptions: some View {
        ForEach(viewModel.questionOptions, id: \.self) { option in
            AnswerRow(
                viewModel: AnswerRowViewModel(
                    text: option,
                    isSelected: option == viewModel.selectedOption
                ), onSelect: {
                    viewModel.selectOption(option: option)
                }
            )
        }
    }
    
    private var skipQuestionButton: some View {
        Text("Skip this question")
            .padding()
            .font(.caption)
            .foregroundColor(.secondary)
            .onTapGesture {
                viewModel.skipQuestion()
            }
    }
    
    private var goToPreviousQuestionButton: some View {
        Image(systemName: "chevron.left")
            .bold()
            .onTapGesture {
                viewModel.goToPreviousQuestion()
            }
    }
    
    private var goToNextQuestionButton: some View {
        Image(systemName: "chevron.right")
            .bold()
            .onTapGesture {
                viewModel.goToNextQuestion()
            }
    }
    
    private var currentIndexLabel: some View {
        Text(viewModel.currentIndex)
    }
}

#Preview {
    QuestionView(
        viewModel: QuestionViewModel(
            questionManager: QuestionManager()
        )
    )
}
