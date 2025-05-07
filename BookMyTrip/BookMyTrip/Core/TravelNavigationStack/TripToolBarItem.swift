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
    
    /// 네비게이션 바 또는 툴바에 사용할 사용자 지정 툴바 아이템을 생성합니다.
    /// - Parameters:
    ///   - label: 툴바 아이템의 콘텐츠 (모양 또는 심볼)
    ///   - action: 아이템 클릭 시 실행할 액션
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
