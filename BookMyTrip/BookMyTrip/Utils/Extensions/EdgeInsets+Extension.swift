//
//  EdgeInsets+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI


extension EdgeInsets {
    
    /// 지정된 수직 및 수평 여백으로 EdgeInsets를 생성합니다.
    /// - Parameters:
    ///   - vertical: 상단과 하단 여백
    ///   - horizontal: 좌우 여백
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(
            top: vertical,
            leading: horizontal,
            bottom: vertical,
            trailing: horizontal
        )
    }
}

extension EdgeInsets {

    /// 모든 방향의 여백이 0인 EdgeInsets를 반환합니다.
    static var zero: EdgeInsets { EdgeInsets(vertical: 0, horizontal: 0) }
}
