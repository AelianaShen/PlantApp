//
//  ContentARView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/5/23.
//

import SwiftUI

struct ContentView: View {
    let viewModel: ContentViewModel
    
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
                ShopView(viewModel: ShopViewModel(cartManager: viewModel.cartManager))
                    .tabItem {
                        Image(systemName: "leaf")
                        Text("Plants")
                    }
                PreferSetView(viewModel: PreferSetViewModel())
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
            .toolbar {
                cartTool
            }
        }
    }
    
    private var cartTool: some View {
        NavigationLink {
            CartView(viewModel: CartViewModel(cartManager: viewModel.cartManager))
        } label: {
            CartButton(viewModel: CartButtonViewModel(numOfProducts: viewModel.cartManager.products.count))
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel())
}
