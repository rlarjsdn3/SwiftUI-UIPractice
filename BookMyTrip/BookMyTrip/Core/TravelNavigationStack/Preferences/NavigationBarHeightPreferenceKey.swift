//
//  NavigationBarHeightPreferenceKey.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct NavigationBarHeightPreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = 30
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
