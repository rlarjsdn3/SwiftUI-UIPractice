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
    
    /// 뷰에 지정된 색상과 불투명도로 그림자를 적용합니다.
    /// - Parameters:
    ///   - color: 그림자 색상 (기본값: .tripGray)
    ///   - opacity: 그림자 불투명도 (기본값: 0.33)
    /// - Returns: 그림자가 적용된 뷰
    func shadow(
        _ color: Color = .tripGray,
        opacity: Double = 0.33
    ) -> some View {
        modifier(DefaultShadow(color: color, opacity: opacity))
    }
}
