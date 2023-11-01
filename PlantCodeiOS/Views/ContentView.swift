//
//  ContentView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/5/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @StateObject var cartManager = CartManager()
    var body: some View {
        if(isOnboardingViewActive){
            OnboardingView()
        } else {
            NavigationView {
                TabView {
                    ARDetectView()
                        .tabItem {
                            Image(systemName: "camera.viewfinder")
                            Text("ARDetect")
                        }
                    ShopView()
                        .tabItem {
                            Image(systemName: "leaf")
                            Text("Plants")
                        }
                        .environmentObject(cartManager)
                    PreferSetView()
                        .tabItem {
                            Image(systemName: "heart")
                            Text("Prefer")
                        }
                    AccountView()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Account")
                        }
                }
                .ignoresSafeArea(.keyboard)
                .toolbar{
                    NavigationLink {
                        CartView()
                            .environmentObject(cartManager)
                    } label: {
                        CartButton(numOfProducts: cartManager.products.count)
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
