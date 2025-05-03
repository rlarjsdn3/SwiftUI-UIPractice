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

            durationTextLine
                .offset(y: -8)

            TemplateImage(asset: .mapPin)
                .frame(width: 12, height: 12)
        }
        .foregroundStyle(Color.travelGray)
    }

    private var durationTextLine: some View {
        VStack(spacing: 3) {
            Text(duration)
                .font(.caption2)
                .fontWeight(.medium)
                .foregroundStyle(Color.travelGray)

            horizontalDashLine
        }
    }

    private var horizontalDashLine: some View {
        HStack(spacing: 4) {
            horizontalLine
            Circle()
                .frame(width: 6, height: 6)
            horizontalLine
        }
    }

    private var horizontalLine: some View {
        HorizontalLine(dash: [1, 3])
    }
}

#Preview {
    TravelDurationView(duration: "5h 30m")
}
