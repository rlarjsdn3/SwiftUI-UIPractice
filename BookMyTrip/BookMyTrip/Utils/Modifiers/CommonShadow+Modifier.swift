//
//  CommonShadow+Modifier.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct CommonShadow: ViewModifier {
    
    let color: Color
    let opacity: Double
    
    func body(content: Content) -> some View {
        content
            .shadow(
                color: color.opacity(opacity),
                radius: 10,
                x: 5,
                y: 5
            )
    }
}

extension View {
    
    func commonShadow(
        _ color: Color = .travelGray,
        opacity: Double = 0.5
    ) -> some View {
        self.modifier(
            CommonShadow(
                color: color,
                opacity: opacity
            )
        )
    }
}
