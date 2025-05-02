//
//  DepartureIndicator.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct DepartureIndicator: View {
    var body: some View {
        VStack(spacing: 6) {
            Image(symbol: .airplane)
                .font(.subheadline)
                .rotationEffect(.degrees(90))
            VerticalLine(
                lineCap: .round,
                dash: [1, 2]
            )
        }
        .frame(width: 30)
        .foregroundStyle(Color.travelGray)
        .clipped()
    }
}

#Preview("From Side Image", traits: .sizeThatFitsLayout) {
    DepartureIndicator()
        .frame(height: 50)
}
