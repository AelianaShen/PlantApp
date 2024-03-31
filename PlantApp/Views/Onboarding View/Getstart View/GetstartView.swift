//
//  GetstartView.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import SwiftUI

struct GetstartView: View {
    @StateObject var viewModel: GetstartViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            titleLabel
            descriptionLabel
        }
        .padding(.horizontal, 40)
        .background(
            backgroundImage
        )
    }
    
    private var titleLabel: some View {
        Text(viewModel.title)
            .font(.title2)
            .bold()
            .frame(width: 280, height: 50)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            .position(x: 160,y: 620)
            .onTapGesture {
                viewModel.isOnboardingViewActive = false
            }
    }
    
    private var descriptionLabel: some View {
        Text(viewModel.description)
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
            .offset(x:0,y:-80)
    }
    
    private var backgroundImage: some View {
        Image(viewModel.systemImageName)
        .offset(x:0,y:-40)
    }
}
