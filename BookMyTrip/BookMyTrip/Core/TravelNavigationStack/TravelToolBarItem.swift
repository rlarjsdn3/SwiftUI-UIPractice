//
//  TravelToolBarItem.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

// TODO: 코드 리팩토링하기
// 툴바 아이템의 목적 - 네비게이션에 맞게 자동으로 크기 및 위치 조절 목적
#warning("TravelToolBarItem 코드 리팩토링")

struct TravelToolBarItem: View {
    let shape: AnyShapeWrapper?
    let symbol: MySymbol?
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
        _ symbol: MySymbol,
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
        Hamburger().eraseToAnyShape()
    ) { }
        .frame(width: 25, height: 20)
}
