//
//  SafeAreaInsetsKey.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/4/25.
//

import SwiftUI
import UIKit

#if disabled
struct SafeAreaInsetsKey: EnvironmentKey {
    
    static let defaultValue: EdgeInsets = {
        if let edgeInsets = Helper.keyWindow()?.safeAreaInsets {
            return edgeInsets.insets
        }
        return .zero
    }()
}
#endif

extension EnvironmentValues {
    
    /// <#Description#>
    @Entry var safeAreaInsets: EdgeInsets = {
        if let edgeInsets = Helper.keyWindow()?.safeAreaInsets {
            return edgeInsets.insets
        }
        return .zero
    }()
}


extension UIEdgeInsets {

    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
