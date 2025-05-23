//
//  FlightDepartureIconView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct FlightDepartureIconView: View {
    
    var body: some View {
        VStack(spacing: 4) {
            Image(symbol: .airplane)
                .font(.subheadline)
                .rotationEffect(.degrees(90))
            VerticalLine(lineCap: .round, dash: [1, 2])
        }
        .foregroundStyle(.tripGray)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FlightDepartureIconView()
        .frame(height: 50)
}
