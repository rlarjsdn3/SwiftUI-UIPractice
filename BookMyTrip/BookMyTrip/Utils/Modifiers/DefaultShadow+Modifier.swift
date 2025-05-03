//
//  DefaultShadow+Modifier.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct DefaultShadow: ViewModifier {
    
    let color: Color
    let opacity: Double
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color.opacity(opacity), radius: 10, x: 5, y: 5)
    }
}

extension View {
    
    func shadow(
        _ color: Color = .tripGray,
        opacity: Double = 0.44
    ) -> some View {
        modifier(DefaultShadow(color: color, opacity: opacity))
    }
}
