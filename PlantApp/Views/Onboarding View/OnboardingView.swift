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
            welcomeView
            onboardViewPage1
            onboardViewPage2
            onboardViewPage3
            onboardViewPage4
            getStartView
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    
    private var welcomeView: some View {
        WelcomeView(viewModel: WelcomeViewModel(title: "PlantsApp", description: "Welcome! Let's find a good place for your new plants friends."))
    }
    
    private var onboardViewPage1: some View {
        OnboardView(viewModel: OnboardViewModel(systemImageName: "Onboarding_1", title: "Pet-friendly", description: "Follow thedicovery strory to choose your optimal preferences. It's optional."))
    }
    
    private var onboardViewPage2: some View {
        OnboardView(viewModel: OnboardViewModel(systemImageName: "Onboarding_2", title: "AR detection", description: "Use your mobile camera to find plants that are best location for your plant."))
    }
    
    private var onboardViewPage3: some View {
        OnboardView(viewModel: OnboardViewModel(systemImageName: "Onboarding_3", title: "It's your choice", description: "choose the best option and schedule when your leafy arrivals."))
    }
    
    private var onboardViewPage4: some View {
        OnboardView(viewModel: OnboardViewModel(systemImageName: "Onboarding_4", title: "Relax", description: "Hangout and we'll deliver your now plant friend straight to your door."))
    }
    
    private var getStartView: some View {
        GetstartView(viewModel: GetstartViewModel(systemImageName: "Onboarding_5", title: "Get Started", description: "I already have an account"))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
