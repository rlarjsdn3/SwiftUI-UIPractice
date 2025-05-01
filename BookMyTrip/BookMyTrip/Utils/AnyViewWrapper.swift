//
//  AnyViewWrapper.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct WrapperView: Identifiable {
    let id = UUID()
    let wrapperView: AnyView
}

extension WrapperView: Equatable {
    static func == (lhs: WrapperView, rhs: WrapperView) -> Bool {
        lhs.id == rhs.id
    }
}
