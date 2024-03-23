//
//  GetstartView.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI

struct GetstartView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    let systemImageName: String
    let title: String
    let dexcription: String
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(title)
                .font(.title2)
                .bold()
                .frame(width: 280, height: 50)
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(10)
                .position(x: 160,y: 620)
                .onTapGesture {
                    isOnboardingViewActive = false
                }
            
            Text(dexcription)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .offset(x:0,y:-80)
        }
        .padding(.horizontal, 40)
        .background(
            Image(systemImageName)
            .offset(x:0,y:-40)
        )
    }
}
