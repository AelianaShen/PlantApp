//
//  AccountViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/21/24.
//

import Foundation
import SwiftUI

class AccountViewModel {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    func toggleOnboardingState() {
        isOnboardingViewActive.toggle()
    }
}
