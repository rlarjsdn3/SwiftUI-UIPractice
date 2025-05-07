//
//  View+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/3/25.
//

import SwiftUI

extension View {
    
    /// 지정된 스타일과 코너 반경으로 둥근 모서리를 적용합니다.
    /// - Parameters:
    ///   - style: 모서리 스타일 (배경에 적용할 스타일)
    ///   - cornerRadius: 모서리 반경 (둥근 정도)
    /// - Returns: 둥근 모서리가 적용된 뷰
    func cornerRadius(_ style: some ShapeStyle, cornerRadius cgfloat: CGFloat) -> some View {
        background(style, in: RoundedRectangle(cornerRadius: cgfloat))
    }
    
    /*
    func cornerRadius<S>(_ style: S, cornerRadius cgfloat: CGFloat) -> some View where S: ShapeStyle {
        // ...
    }
    */
}


