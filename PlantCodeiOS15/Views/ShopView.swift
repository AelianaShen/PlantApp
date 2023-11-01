//
//  ShopView.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/6/23.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        VStack(spacing: 0.0) {
            Text("Plants")
                .fontWeight(.bold)
                .font(.title2)
                .foregroundColor(ProjColor.PrimaryGreen)
            
            SearchBar()
                .padding(EdgeInsets(top: 25, leading: 20, bottom: 20, trailing: 20))
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ScrollSection(productsList: plantList)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
