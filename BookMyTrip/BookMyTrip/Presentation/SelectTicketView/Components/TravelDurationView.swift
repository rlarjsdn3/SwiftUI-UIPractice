//
//  TravelDurationView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct TravelDurationView: View {
    
    let duration: String

    var body: some View {
        HStack(spacing: 2.5) {
            Image(symbol: .airplane)
                .font(.caption)

            flightDurationLabel
                .offset(y: -8.5)

            Image(asset: .mapPin)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
        }
        .foregroundStyle(.tripGray)
    }

    private var flightDurationLabel: some View {
        VStack(spacing: 3) {
            Text(duration)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.tripGray)

            HStack(spacing: 4) {
                horizontalLine
                Circle()
                    .frame(width: 6, height: 6)
                horizontalLine
            }
        }
    }

    private var horizontalLine: some View {
        HorizontalLine(lineWidth: 2, lineCap: .round, dash: [0.5, 5])
    }
}

#Preview {
    TravelDurationView(duration: "5h 30m")
}
