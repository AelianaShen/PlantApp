//
//  AccountView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/5/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        VStack {
            personImage
            personName
            onboardingButton
        }
    }
    
    private var personImage: some View {
        Image(systemName: "person.crop.circle")
            .resizable()
            .foregroundColor(ProjColor.SnowDrift)
            .frame(width: 200, height: 200)
            .padding()
    }
    
    private var personName: some View {
        Text("Aeliana Shen")
            .font(.title)
            .foregroundColor(ProjColor.PrimaryGreen)
            .bold()
            .padding(.bottom, 50)
    }
    
    private var onboardingButton: some View {
        Button(action: {
            viewModel.toggleOnboardingState()
        }) {
            Text("Back to Onboarding")
                .font(.title3)
                .bold()
                .frame(width: 280, height: 50)
                .background(ProjColor.Gumleaf)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    AccountView(viewModel: AccountViewModel())
}
