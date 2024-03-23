//
//  WelcomeView.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var viewModel: WelcomeViewModel
    
    init(viewModel: WelcomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            leafImage
            titleLabel
            descriptionLabel
        }
        .padding(.horizontal, 40)
    }
    
    private var leafImage: some View {
        Image("leaf_icon_48")
    }
    
    private var titleLabel: some View {
        Text(viewModel.title)
            .font(.title).bold()
    }
    
    private var descriptionLabel: some View {
        Text(viewModel.description)
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
    }
}
