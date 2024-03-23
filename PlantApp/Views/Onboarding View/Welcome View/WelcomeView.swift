//
//  WelcomeView.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    let title: String
    let dexcription: String
    var body: some View {
        VStack(spacing: 20) {
            Image("leaf_icon_48")
            Text(title)
                .font(.title).bold()
            
            Text(dexcription)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 40)
    }
}
