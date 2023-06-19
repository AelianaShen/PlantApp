//
//  PreferSetView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/5/23.
//

import SwiftUI

struct PreferSetView: View {
    @StateObject var questionManager = QuestionManager()
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("plant_dev_icon")
                
                Text("Follow the discovery story to find your optimal choice")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                
                NavigationLink {
                    QuestionView()
                        .environmentObject(questionManager)
                } label: {
                    PrimaryBtn(text: "Set My Preference")
                }
                
            }
            .padding(.horizontal, 40)
        }
        
    }
}

struct PreferSetView_Previews: PreviewProvider {
    static var previews: some View {
        PreferSetView()
    }
}
