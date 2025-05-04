//
//  IdentifableAnyView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

// Technically, most instances of SwiftUI views should be "naturally" sendable.
struct IdentifableAnyView: Identifiable, @unchecked Sendable {
    let id = UUID()
    let view: AnyView

    init(_ view: AnyView) {
        self.view = view
    }
}
extension IdentifableAnyView: Equatable {
    static func == (lhs: IdentifableAnyView, rhs: IdentifableAnyView) -> Bool {
        lhs.id == rhs.id
    }
}

extension View {
    func eraseToIdentifiableAnyView() -> IdentifableAnyView {
        IdentifableAnyView(AnyView(self))
    }
}
