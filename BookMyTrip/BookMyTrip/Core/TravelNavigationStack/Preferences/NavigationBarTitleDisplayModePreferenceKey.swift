//
//  NavigationBarTitleDisplayModePreferenceKey.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

@MainActor
struct NavigationBarTitleDisplayModePreferenceKey: @preconcurrency PreferenceKey {
    static let defaultValue: NavigationBarItem.TitleDisplayMode = .inline
    static func reduce(value: inout NavigationBarItem.TitleDisplayMode, nextValue: () -> NavigationBarItem.TitleDisplayMode) {
        value = nextValue()
    }
}
