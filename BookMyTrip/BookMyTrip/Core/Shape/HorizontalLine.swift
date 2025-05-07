//
//  HorizontalLine.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct HorizontalLine: Shape {

    let lineWidth: CGFloat
    let lineCap: CGLineCap
    let lineJoin: CGLineJoin
    let miterLimit: CGFloat
    let dash: [CGFloat]
    let dashPhase: CGFloat
    
    /// 선의 스타일을 설정하는 초기화 메서드입니다.
    /// - Parameters:
    ///   - lineWidth: 선의 두께 (기본값: 1)
    ///   - lineCap: 선 끝의 모양 (기본값: .butt)
    ///   - lineJoin: 선 연결 모양 (기본값: .miter)
    ///   - miterLimit: 마이터 제한 값 (기본값: 10)
    ///   - dash: 점선 패턴 (기본값: 빈 배열)
    ///   - dashPhase: 점선의 시작 지점 (기본값: 0)
    public init(
        lineWidth: CGFloat = 1,
        lineCap: CGLineCap = .butt,
        lineJoin: CGLineJoin = .miter,
        miterLimit: CGFloat = 10,
        dash: [CGFloat] = [CGFloat](),
        dashPhase: CGFloat = 0
    ) {
        self.lineWidth = lineWidth
        self.lineCap = lineCap
        self.lineJoin = lineJoin
        self.miterLimit = miterLimit
        self.dash = dash
        self.dashPhase = dashPhase
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(toX: 0, y: rect.midY)
        path.addLine(toX: rect.maxX, y: rect.midY)
        return path.strokedPath(
            StrokeStyle(
                lineWidth: lineWidth,
                lineCap: lineCap,
                lineJoin: lineJoin,
                miterLimit: miterLimit,
                dash: dash,
                dashPhase: dashPhase
            )
        )
    }

    func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        CGSize(width: proposal.width ?? 0, height: lineWidth)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HorizontalLine(lineWidth: 2, lineCap: .square, dash: [5, 10])
}

#Preview(traits: .sizeThatFitsLayout) {
    HorizontalLine(lineWidth: 20, lineCap: .round, dash: [0.5, 8])
}
