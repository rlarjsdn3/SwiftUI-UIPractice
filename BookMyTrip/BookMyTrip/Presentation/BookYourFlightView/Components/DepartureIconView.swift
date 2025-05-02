//
//  DepartureIconView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct DepartureIconView: View {
    var body: some View {
        VStack(spacing: 4) {
            Image(symbol: .airplane)
                .font(.subheadline)
                .rotationEffect(.degrees(90))
            VerticalLine(lineCap: .round, dash: [1, 2])
        }
        .foregroundStyle(Color.travelGray)
    }
}

#Preview("From Side Image", traits: .sizeThatFitsLayout) {
    DepartureIconView()
        .frame(height: 50)
}
