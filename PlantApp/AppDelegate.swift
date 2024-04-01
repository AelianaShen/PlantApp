//
//  AppDelegate.swift
//  PlantApp
//
//  Created by Aeliana Shen on 11/6/23.
//

import SwiftUI

@main
struct PlantApp: App {
    @StateObject private var userPreferData = UserPreferData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userPreferData)
        }
    }
}

