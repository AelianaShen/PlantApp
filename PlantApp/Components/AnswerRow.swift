//
//  AnswerRow.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/8/23.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var questionManager: QuestionManager
    
    var text: String
    var isSelected: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Text(text)
                .bold()
            if (isSelected) {
                Image(systemName: "checkmark")
                    .bold()
                    .font(.caption)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(isSelected ? .white : ProjColor.PrimaryGreen)
        .background(isSelected ? ProjColor.PrimaryGreen : ProjColor.Edgewater)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !isSelected {
                questionManager.select(answer: text)
            } else {
                questionManager.unselectAnswer()
            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(text: "Option 1", isSelected: false)
            .environmentObject(QuestionManager())
    }
}
