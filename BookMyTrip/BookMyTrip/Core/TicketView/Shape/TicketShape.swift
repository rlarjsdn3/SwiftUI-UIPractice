//
//  TicketShape.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct TicketShape: Shape {

    ///
    let ellipsisSize: CGFloat
    ///
    let ellipsisOffset: CGFloat
    //
    let cornerRadius: CGFloat
    
    /// <#Description#>
    /// - Parameters:
    ///   - ellipsisSize: <#ellipsisSize description#>
    ///   - ellipsisOffset: <#ellipsisOffset description#>
    ///   - cornerRadius: <#cornerRadius description#>
    init(
        ellipsisSize: CGFloat,
        ellipsisOffset: CGFloat,
        cornerRadius: CGFloat
    ) {
        self.ellipsisSize = ellipsisSize
        self.ellipsisOffset = ellipsisOffset
        self.cornerRadius = cornerRadius
    }

    func path(in rect: CGRect) -> Path {

        let roundedRect = Path(
            roundedRect: rect,
            cornerRadius: cornerRadius,
            style: .continuous
        )

        let circleSize = CGSize(uniformSize: ellipsisSize)
        let leftCirclePositionX = rect.minX - (ellipsisSize / 2)
        let rightCirclePositionX = rect.maxX - (ellipsisSize / 2)
        let circlePositionY = ellipsisOffset
        
        let leftCircle = Path(
            ellipseIn:
                CGRect(
                    origin: CGPoint(
                        x: leftCirclePositionX,
                        y: circlePositionY
                    ),
                    size: circleSize
                )
        )
        let rightCircle = Path(
            ellipseIn: CGRect(
                origin: CGPoint(
                    x: rightCirclePositionX,
                    y: circlePositionY
                ),
                size: circleSize
            )
        )

        return roundedRect
            .subtracting(leftCircle)
            .subtracting(rightCircle)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    TicketShape(
        ellipsisSize: 25,
        ellipsisOffset: 100,
        cornerRadius: 30
    )
    .fill(.gray)
    .frame(height: 350)
    .padding()
}
