//
//  View+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/3/25.
//

import SwiftUI

extension View {
    
    /// <#Description#>
    /// - Parameters:
    ///   - style: <#s description#>
    ///   - cornerRadius: <#cgfloat description#>
    /// - Returns: <#description#>
    func cornerRadius(_ style: some ShapeStyle, cornerRadius cgfloat: CGFloat) -> some View {
        background(style, in: RoundedRectangle(cornerRadius: cgfloat))
    }
}


