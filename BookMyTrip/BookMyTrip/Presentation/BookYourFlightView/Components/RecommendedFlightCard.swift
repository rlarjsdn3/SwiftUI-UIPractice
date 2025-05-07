//
//  RecommendedFlightCard.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/3/25.
//

import SwiftUI

struct RecommendedFlightCard: View {
    
    private let flight: RecommendedFlight

    init(flight: RecommendedFlight) {
        self.flight = flight
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                airplaneIconView
                Spacer()
            }
            .padding(.bottom, 10)
            
            flightCompactInfo
        }
        .padding(.horizontal, 12)
        .frame(width: 140)
        .frame(maxHeight: 150)
        .cornerRadius(linearGradient(flight.color), cornerRadius: 20)
        .shadow(flight.color, opacity: 0.55)
    }
}

extension RecommendedFlightCard {

    private var airplaneIconView: some View {
        HStack {
            Image(symbol: .airplane)
                .font(.headline)
                .foregroundStyle(flight.color)
                .rotationEffect(.degrees(-45))
                .padding(6)
                .cornerRadius(.white, cornerRadius: 8)

            Spacer()
        }
    }

    @ViewBuilder
    private var flightCompactInfo: some View {
        Text(flight.date.format(.dMMMMyyyy))
            .font(.caption2)
            .fontWeight(.light)
            .foregroundStyle(Color.white)

        HStack {
            Text(flight.departure)
                .fontWeight(.semibold)
            Image(symbol: .arrowLeftRight)
                .font(.caption2)
            Text(flight.arrival)
                .fontWeight(.semibold)
        }
        .foregroundStyle(.white)
        .padding(.bottom, 5)

        HStack(spacing: 0) {
            Text("$")
            Text("\(flight.price)")
        }
        .fontWeight(.semibold)
        .foregroundStyle(.white)
    }

    private func linearGradient(_ color: Color) -> some ShapeStyle {
        LinearGradient(
            stops: [.init(color: color.opacity(0.77), location: 0.0),
                    .init(color: color, location: 0.6),
                    .init(color: color, location: 1.0)],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

#Preview {
    RecommendedFlightCard(flight: appData.recommendedFlights[0])
}
