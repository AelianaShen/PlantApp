//
//  ContentViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
}
