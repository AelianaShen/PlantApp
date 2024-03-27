//
//  ContentARView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/5/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        if viewModel.isOnboardingViewActive {
            OnboardingView()
        } else {
            navigationViews
        }
    }
    
    private var navigationViews: some View {
        NavigationView {
            TabView {
                ARDetectView()
                    .tabItem {
                        Image(systemName: "camera.viewfinder")
                        Text("ARDetect")
                    }
                ShopView(cartManager: cartManager)
                    .tabItem {
                        Image(systemName: "leaf")
                        Text("Plants")
                    }
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
                cartTool
            }
        }
    }
    
    private var cartTool: some View {
        NavigationLink {
            CartView(cartManager: cartManager, viewModel: CartViewModel(cartManager: cartManager))
        } label: {
            CartButton(viewModel: CartButtonViewModel(numOfProducts: cartManager.products.count))
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel(), cartManager: CartManager())
}
