//
//  TravelToolBarItem.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct TravelToolBarItem: View {
    var symbol: TravelSymbol
    var action: () -> Void

    init(
        _ symbol: TravelSymbol,
        action: @escaping () -> Void
    ) {
        self.symbol = symbol
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            Image(symbol: symbol)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.black)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TravelToolBarItem(.airplane) {
    }
}
