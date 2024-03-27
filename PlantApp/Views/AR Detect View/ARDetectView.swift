//
//  ARDetectView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 5/26/23.
//

import SwiftUI

struct ARDetectView: View {
    @StateObject var viewModel = ARDetectViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            scanIcon
            guideline
            arPlaceBoxButton
        }
        .padding(.horizontal, 40)
    }
    
    private var scanIcon: some View {
        Image("scan_icon")
    }
    
    private var guideline: some View {
        Text(viewModel.guidelineString)
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
    }
    
    private var arPlaceBoxButton: some View {
        NavigationLink {
            ARPlaceBoxView()
        } label: {
            PrimaryButton(text: viewModel.buttonString)
        }
    }
}

#Preview {
    ARDetectView(viewModel: ARDetectViewModel())
}
