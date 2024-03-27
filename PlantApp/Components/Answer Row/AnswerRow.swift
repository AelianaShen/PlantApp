//
//  AnswerRow.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/8/23.
//

import SwiftUI

struct AnswerRow: View {
    @ObservedObject var viewModel: AnswerRowViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            buttonText
            if (viewModel.isSelected) {
                checkMark
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(viewModel.isSelected ? .white : ProjColor.PrimaryGreen)
        .background(viewModel.isSelected ? ProjColor.PrimaryGreen : ProjColor.Edgewater)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            handleTap()
        }
    }
    
    private var buttonText: some View {
        Text(viewModel.text)
            .bold()
    }
    
    private var checkMark: some View {
        Image(systemName: "checkmark")
            .bold()
            .font(.caption)
    }
    
    private func handleTap(){
        if !viewModel.isSelected {
            viewModel.questionManager.select(answer: viewModel.text)
        } else {
            viewModel.questionManager.unselectAnswer()
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(viewModel: AnswerRowViewModel(text: "Option 1", isSelected: false, questionManager: QuestionManager()))
    }
}
