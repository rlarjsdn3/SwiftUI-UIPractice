//
//  VerticalLine.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct VerticalLine: Shape, StrokeConfigurable {

    ///
    let lineWidth: CGFloat
    ///
    let lineCap: CGLineCap
    ///
    let lineJoin: CGLineJoin
    ///
    let miterLimit: CGFloat
    ///
    let dash: [CGFloat]
    ///
    let dashPhase: CGFloat

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
        path.move(toX: rect.midX, y: 0)
        path.addLine(toX: rect.midX, y: rect.maxY)
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
        CGSize(width: 1, height: proposal.height ?? 0)
    }
}

#Preview("VerticalLine #1", traits: .sizeThatFitsLayout) {
    VerticalLine(
        lineWidth: 2,
        lineCap: .square,
        dash: [5, 10]
    )
}

#Preview("VerticalLine #2", traits: .sizeThatFitsLayout) {
    VerticalLine(
        lineWidth: 1,
        lineCap: .round,
        dash: [0.5, 3]
    )
}
