//
//  SearchBarView.swift
//  StockApp
//
//  Created by Ankit Sharma on 14/09/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            TextField("Seach stock", text: $searchTerm)
                .foregroundColor(Color.primary)
                .padding(10)
            Spacer()
        }
        .foregroundColor(.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .padding(10)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchTerm: .constant(""))
    }
}
