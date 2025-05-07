//
//  SafeAreaInsetsKey.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/4/25.
//

import SwiftUI
import UIKit

struct SafeAreaInsetsKey: @preconcurrency EnvironmentKey {

    @MainActor
    static let defaultValue: EdgeInsets = {
        if let edgeInsets = Helper.keyWindow()?.safeAreaInsets {
            return edgeInsets.insets
        }
        return .zero
    }()
}

extension EnvironmentValues {
    
    /// 안전 영역(Safe Area) 여백 값을 반환합니다.
    var safeAreaInsets: EdgeInsets {
        get { self[SafeAreaInsetsKey.self] }
        set { self[SafeAreaInsetsKey.self] = newValue }
    }
}


extension UIEdgeInsets {

    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
