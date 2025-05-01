//
//  TravelToolBarItem.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct TravelToolBarItem: View {
    let shape: AnyShapeWrapper?
    let symbol: SFSymbol?
    let action: () -> Void

    init(
        _ shape: AnyShapeWrapper,
        action: @escaping () -> Void
    ) {
        self.shape = shape
        self.symbol = nil
        self.action = action
    }

    init(
        _ symbol: SFSymbol,
        action: @escaping () -> Void
    ) {
        self.shape = nil
        self.symbol = symbol
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            Group {
                if let symbol = symbol {
                    Image(symbol: symbol)
                        .fontWeight(.semibold)
                }

                if let shape = shape {
                    shape
                }
            }
            .font(.title3)
            .foregroundStyle(Color.label)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TravelToolBarItem(.airplane) { }
}


#Preview(traits: .sizeThatFitsLayout) {
    TravelToolBarItem(
        Hamburger3Line().eraseToAnyShape()
    ) { }
        .frame(width: 25, height: 20)
}
