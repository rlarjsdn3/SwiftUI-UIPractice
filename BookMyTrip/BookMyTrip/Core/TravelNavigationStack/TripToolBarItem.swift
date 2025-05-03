//
//  TripToolBarItem.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

enum TripToolBarContent {
    case symbol(MySymbol)
    case shape(any Shape)
}

struct TripToolBarItem: View {
    private let label: TripToolBarContent
    private let action: () -> Void
    
    init(_ label: TripToolBarContent, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            Group {
                switch label {
                case .shape(let shape):
                    AnyShape(shape)
                case .symbol(let symbol):
                    Image(symbol: symbol)
                        .fontWeight(.semibold)
                }
            }
            .font(.title3)
            .foregroundStyle(.label)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TripToolBarItem(.shape(.hamburger)) { }
}

#Preview(traits: .sizeThatFitsLayout) {
    TripToolBarItem(.symbol(.airplane)) { }
}
