//
//  ARDetectView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 5/26/23.
//

import SwiftUI

struct ARDetectView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("scan_icon")
            
            Text("Open your camera and decide where to place your plant. We are going to find the best plant choice for you!")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            NavigationLink {
                ARPlaceBoxView()
            } label: {
                PrimaryBtn(text: "Find a place for your plant")
            }
        }
        .padding(.horizontal, 40)
    }
}

struct ARDetectView_Previews: PreviewProvider {
    static var previews: some View {
        ARDetectView()
    }
}
