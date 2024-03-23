//
//  OnboardView.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI

struct OnboardView: View {
    let systemImageName: String
    let title: String
    let dexcription: String
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(title)
                .font(.title).bold()
                .position(x: 160,y: 600)
            
            Text(dexcription)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .offset(x:0,y:-80)
        }
        .padding(.horizontal, 40)
        .background(Image(systemImageName)
            .offset(x:0,y:-40)
        )
    }
}
