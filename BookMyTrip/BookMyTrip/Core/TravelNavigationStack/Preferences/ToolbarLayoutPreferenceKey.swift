//
//  ToolbarPreferenceKey.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct ToolbarLayout: Equatable {
    let leadingToolbar: IdentifiedView?
    let leadingSpacing: CGFloat?
    let trarilingToolbar: IdentifiedView?
    let trailingSpacing: CGFloat?

    init(
        leadingToolbar: IdentifiedView? = nil,
        leadingSpacing: CGFloat? = nil,
        trarilingToolbar: IdentifiedView? = nil,
        trailingSpacing: CGFloat? = nil
    ) {
        self.leadingToolbar = leadingToolbar
        self.leadingSpacing = leadingSpacing
        self.trarilingToolbar = trarilingToolbar
        self.trailingSpacing = trailingSpacing
    }
}

@MainActor
struct ToolbarLayoutPreferenceKey: @preconcurrency PreferenceKey {
    static let defaultValue: ToolbarLayout = .init()
    static func reduce(value: inout ToolbarLayout, nextValue: () -> ToolbarLayout) {
        value = nextValue()
    }
}
