//
//  OnboardingView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 5/26/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            WelcomeView(title: "PlantsApp", dexcription: "Welcome! Let's find a good place for your new plants friends.")
            OnboardView(systemImageName: "Onboarding_1", title: "Pet-friendly", dexcription: "Follow thedicovery strory to choose your optimal preferences. It's optional.")
            OnboardView(systemImageName: "Onboarding_2", title: "AR detection", dexcription: "Use your mobile camera to find plants that are best location for your plant.")
            OnboardView(systemImageName: "Onboarding_3", title: "It's your choice", dexcription: "choose the best option and schedule when your leafy arrivals.")
            OnboardView(systemImageName: "Onboarding_4", title: "Relax", dexcription: "Hangout and we'll deliver your now plant friend straight to your door.")
            GetstartView(systemImageName: "Onboarding_5", title: "Get Started", dexcription: "I already have an account")
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

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
