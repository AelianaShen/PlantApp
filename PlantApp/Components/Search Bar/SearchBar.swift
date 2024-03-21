//
//  SearchBar.swift
//  PlantCodeiOS15
//
//  Created by Aeliana Shen on 6/14/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            magnifyingglassImage
            searchTextFiedld
            micImage
        }
        .padding(EdgeInsets(top: 7, leading: 8, bottom: 7, trailing: 8))
        .font(.headline)
        .background(.ultraThinMaterial)
        .foregroundColor(ProjColor.PrimaryGreen.opacity(0.6))
        .cornerRadius(10)
    }
    
    private var magnifyingglassImage: some View {
        Image(systemName: "magnifyingglass")
    }
    
    private var searchTextFiedld: some View {
        TextField("Search", text: $searchText)
    }
    
    private var micImage: some View {
        Image(systemName: "mic.fill")
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
