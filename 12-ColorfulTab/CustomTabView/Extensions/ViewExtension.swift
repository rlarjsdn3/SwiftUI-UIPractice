//
//  UIApplicationExtension.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/11.
//

import SwiftUI
import Foundation

extension View {
    /// 베젤이 있는 기종( iPhone SE 등)은 0을 리턴하고, 베젤이 없는 기종(iPhone X 등)은 0이 아닌 값을 리턴합니다.
    var bottomSafeAreaInsets: CGFloat? {
        UIApplication.shared.windows.first?.safeAreaInsets.bottom
    }
}
