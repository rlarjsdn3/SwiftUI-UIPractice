//
//  Shape+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

@available(*, deprecated)
extension Shape where Self == RoundedRectangle {

    ///
    static var cornerRadius20: Self {
        cornerRadius(20)
    }

    ///
    static var cornerRadius22_5: Self {
        cornerRadius(22.5)
    }

    ///
    static var cornerRadius25: Self {
        cornerRadius(25)
    }

    ///
    static var cornerRadius27_5: Self {
        cornerRadius(27.5)
    }

    ///
    static var cornerRadius30: Self {
        cornerRadius(30)
    }

    /// <#Description#>
    /// - Parameter cgfloat: <#cgfloat description#>
    /// - Returns: <#description#>
    static func cornerRadius(_ cgfloat: CGFloat) -> Self {
        .init(cornerRadius: cgfloat)
    }
}
