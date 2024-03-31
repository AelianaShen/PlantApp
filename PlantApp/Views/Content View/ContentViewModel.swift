//
//  ContentViewModel.swift
//  PlantApp
//
//  Created by Aeliana Shen on 3/22/24.
//

import Foundation
import SwiftUI

final class ContentViewModel {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    let cartManager = CartManager()
}
