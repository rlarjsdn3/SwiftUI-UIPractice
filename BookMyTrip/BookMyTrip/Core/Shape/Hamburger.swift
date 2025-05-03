//
//  Hamburger.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct Hamburger: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(toX: rect.minX, y: 0)
        path.addLine(toX: rect.midX, y: 0)
        path.move(toX: rect.minX, y: rect.midY)
        path.addLine(toX: rect.maxX, y: rect.midY)
        path.move(toX: rect.midX, y: rect.maxY)
        path.addLine(toX: rect.maxX, y: rect.maxY)

        return path
            .strokedPath(
                StrokeStyle(
                    lineWidth: 2.5,
                    lineCap: .round
                )
            )
    }

    func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        CGSize(width: 25, height: 20)
    }
}
// This extension applies only when `Self` is `Hamburger` and conforms to the `Shape` protocol.
extension Shape where Self == Hamburger {
    static var hamburger: Self { self.init() }
}

#Preview(traits: .sizeThatFitsLayout) {
    Hamburger()
}
