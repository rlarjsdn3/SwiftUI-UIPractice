//
//  CapsuleSearchBar.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct CapsuleSearchBar: View {
    @Binding var searchQuery: String

    init(searchQuery: Binding<String>) {
        self._searchQuery = searchQuery
    }

    var body: some View {
        HStack {
            magnifyingGlassImage
                .padding(.leading, 7.5)

            TextField(
                "SearchQuery",
                text: $searchQuery,
                prompt: placeholderText
            )
            .tint(Color.travelGray)
        }
        .padding()
        .background(Color.travelSecondary, in: .capsule)
    }
    
    private var magnifyingGlassImage: some View {
        Image(symbol: .magnifyingGlass)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(Color.travelGray)
    }
    
    private var placeholderText: Text {
        Text("Search Flight, Hotels, etc...")
            .font(.subheadline)
            .foregroundStyle(Color.travelGray)
    }
}

#Preview {
    CapsuleSearchBar(searchQuery: .constant(""))
}
