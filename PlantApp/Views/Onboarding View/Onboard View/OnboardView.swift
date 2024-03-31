//
//  OnboardView.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import SwiftUI

struct OnboardView: View {
    @StateObject var viewModel: OnboardViewModel
    
    init(viewModel: OnboardViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
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
            .font(.title).bold()
            .position(x: 160,y: 600)
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
