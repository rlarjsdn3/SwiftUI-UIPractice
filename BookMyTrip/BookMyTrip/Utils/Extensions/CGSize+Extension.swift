//
//  CGSize+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

extension CGSize {
    
    /// 동일한 너비와 높이를 가진 크기를 생성합니다.
    /// - Parameter uniformSize: 너비와 높이에 사용할 크기
    init(uniformSize cgfloat: CGFloat) {
        self.init(width: cgfloat, height: cgfloat)
    }
}
