//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by 김건우 on 2023/01/29.
//

import CoreGraphics

struct HexagonParameters {
    struct Segment {
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    
    static let adjustmemnt: CGFloat = 0.085
    
    static let segments = [
        Segment(
            line:    CGPoint(x: 0.60, y: 0.05),
            curve:   CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20 + adjustmemnt),
            curve:   CGPoint(x: 0.00, y: 0.30 + adjustmemnt),
            control: CGPoint(x: 0.00, y: 0.25 + adjustmemnt)
        ),
        Segment(
            line:    CGPoint(x: 0.00, y: 0.70 - adjustmemnt),
            curve:   CGPoint(x: 0.05, y: 0.80 - adjustmemnt),
            control: CGPoint(x: 0.00, y: 0.75 - adjustmemnt)
        ),
        Segment(
            line:    CGPoint(x: 0.40, y: 0.95),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:    CGPoint(x: 0.95, y: 0.80 - adjustmemnt),
            curve:   CGPoint(x: 1.00, y: 0.70 - adjustmemnt),
            control: CGPoint(x: 1.00, y: 0.75 - adjustmemnt)
        ),
        Segment(
            line:    CGPoint(x: 1.00, y: 0.30 + adjustmemnt),
            curve:   CGPoint(x: 0.95, y: 0.20 + adjustmemnt),
            control: CGPoint(x: 1.00, y: 0.25 + adjustmemnt)
        )
    ]
}
