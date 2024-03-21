//
//  QuestionView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/8/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var questionManager: QuestionManager
    
    var body: some View {
        VStack(spacing: 20){
            
            Text(questionManager.question!.description)
                .multilineTextAlignment(.center)
                .padding(.bottom, 30)
                .font(.headline)

            ForEach(questionManager.question!.options, id: \.self){
                option in
                let selectedOption = questionManager.answerChoices[questionManager.index]
                let isSelected = (option == selectedOption)
                AnswerRow(viewModel: AnswerRowViewModel(text: option, isSelected: isSelected))
                    .environmentObject(questionManager)
            }

            Text("Skip this question")
                .padding()
                .font(.caption)
                .foregroundColor(.secondary)
                .onTapGesture {
                    questionManager.skipQuestion()
                }

            HStack {
                if !questionManager.reachedFront {
                    Image(systemName: "chevron.left")
                        .bold()
                        .onTapGesture {
                            questionManager.goToPreviousQuestion()
                        }
                }
                
                Spacer()
                
                Text(String(questionManager.questionsIterator.currentIndex) + " / 6")
                
                Spacer()
                
                if !questionManager.reachedEnd {
                    Image(systemName: "chevron.right")
                    .bold()
                    .onTapGesture {
                        questionManager.goToNextQuestion()
                    }
                }
            }
            
        }
        .padding(50)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.navigationBarBackButtonHidden()
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuestionManager())
    }
}
