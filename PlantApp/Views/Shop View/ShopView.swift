//
//  ShopView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/6/23.
//

import SwiftUI

struct ShopView: View {
    let viewModel: ShopViewModel
    
    var body: some View {
        VStack(spacing: 0.0) {
            appTitle
            searchBar
            scrollProducts
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
    private var appTitle: some View {
        Text("Plants")
            .fontWeight(.bold)
            .font(.title2)
            .foregroundColor(ProjColor.PrimaryGreen)
    }
    
    private var searchBar: some View {
        SearchBar(searchText: viewModel.searchTextBinding)
            .padding(EdgeInsets(top: 25, leading: 20, bottom: 20, trailing: 20))
    }
    
    private var scrollProducts: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ScrollSection(
                    viewModel: ScrollSectionViewModel(
                        plantService: PlantService(),
                        cartManager: viewModel.cartManager
                    )
                )
            }
        }
    }
}

#Preview {
    ShopView(
        viewModel: ShopViewModel(
            cartManager: CartManager()
        )
    )
}
