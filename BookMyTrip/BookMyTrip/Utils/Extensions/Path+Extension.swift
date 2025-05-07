//
//  Path+Extension.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

extension Path {
    
    /// 지정된 좌표로 이동합니다.
    /// - Parameters:
    ///   - x: 이동할 x 좌표
    ///   - y: 이동할 y 좌표
    mutating func move(toX x: Double, y: Double) {
        self.move(to: CGPoint(x: x, y: y))
    }

    /// 지정된 좌표까지 직선을 추가합니다.
    /// - Parameters:
    ///   - x: 끝 점의 x 좌표
    ///   - y: 끝 점의 y 좌표
    mutating func addLine(toX x: Double, y: Double) {
        self.addLine(to: CGPoint(x: x, y: y))
    }
}
