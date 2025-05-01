//
//  RoundedTextField.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct RoundedTextField: View {
    @Binding var searchQuery: String

    init(searchQuery: Binding<String>) {
        self._searchQuery = searchQuery
    }

    var body: some View {
        HStack {
            Image(symbol: .magnifyingGlass)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(Color.travelGray)
                .padding(.leading, 7.5)

            TextField(
                "SearchQuery",
                text: $searchQuery,
                prompt: Text("Search Flight, Hotels, etc...")
                    .font(.subheadline)
                    .foregroundStyle(Color.travelGray)
            )
            .tint(Color.travelGray)
        }
        .padding()
        .background(Color.travelSecondary, in: Capsule())
    }
}

#Preview {
    RoundedTextField(searchQuery: .constant(""))
}
