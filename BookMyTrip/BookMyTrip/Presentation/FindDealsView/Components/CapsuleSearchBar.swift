//
//  CapsuleSearchBar.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct CapsuleSearchBar: View {

    @Binding private var searchQuery: String

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
            .tint(.tripGray)
        }
        .padding()
        .background(.tripSecondary, in: .capsule)
    }
}

extension CapsuleSearchBar {

    private var magnifyingGlassImage: some View {
        Image(symbol: .magnifyingGlass)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.tripGray)
    }

    private var placeholderText: Text {
        Text("Search Flight, Hotels, etc...")
            .font(.subheadline)
            .foregroundStyle(.tripGray)
    }
}

#Preview {
    CapsuleSearchBar(searchQuery: .constant(""))
}
