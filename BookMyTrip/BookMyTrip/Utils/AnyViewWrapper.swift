//
//  AnyViewWrapper.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct AnyViewWrapper: Identifiable {
    let id = UUID()
    let wrapperView: AnyView

    init(_ view: AnyView) {
        self.wrapperView = view
    }
}

extension AnyViewWrapper: Equatable {
    static func == (lhs: AnyViewWrapper, rhs: AnyViewWrapper) -> Bool {
        lhs.id == rhs.id
    }
}

extension View {
    func eraseToAnyView() -> AnyViewWrapper {
        AnyViewWrapper(AnyView(self))
    }
}
