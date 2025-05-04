//
//  SafeAreaInsetsKey.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/4/25.
//

import SwiftUI
import UIKit

struct SafeAreaInsetsKey: EnvironmentKey {
    
    static let defaultValue: EdgeInsets = {
        if let edgeInsets = Helper.keyWindow()?.safeAreaInsets {
            return edgeInsets.insets
        }
        return .zero
    }()
}

extension EnvironmentValues {
    
    var safeAreaInsets: EdgeInsets {
        get { self[SafeAreaInsetsKey.self] }
        set { self[SafeAreaInsetsKey.self] = newValue }
    }
}


private extension UIEdgeInsets {

    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
