//
//  TitlePreferenceKey.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct NavigationBarTitlePreferenceKey: PreferenceKey {
    static let defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

