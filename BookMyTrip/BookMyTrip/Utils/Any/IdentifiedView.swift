//
//  IdentifiedView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

// Technically, most instances of SwiftUI views should be "naturally" sendable.
struct IdentifiedView: Identifiable, @unchecked Sendable {
    let id = UUID()
    let view: AnyView

    init(_ view: AnyView) {
        self.view = view
    }
}
extension IdentifiedView: Equatable {
    static func == (lhs: IdentifiedView, rhs: IdentifiedView) -> Bool {
        lhs.id == rhs.id
    }
}

extension View {
    var eraseToIdentifiedView: IdentifiedView {
        IdentifiedView(AnyView(self))
    }

    @available(*, deprecated, renamed: "erasseToIdentifedView")
    func eraseToIdentifiableAnyView() -> IdentifiedView {
        IdentifiedView(AnyView(self))
    }
}
