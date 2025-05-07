//
//  AirwaysTicketView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct AirwaysTicketView: View {
    
    private let ticket: Ticket

    init(ticket: Ticket) {
        self.ticket = ticket
    }

    var body: some View {
        TicketView {
            headerView
                .padding(.top, 6)
                .padding(.horizontal, 24)
        } footerView: {
            footerView
                .padding(.horizontal, 10)
                .padding(.top, 22)
                .padding(.bottom, 20)
        }
    }
}

extension AirwaysTicketView {

    private var headerView: some View {
        HStack {
            Image(symbol: .airplane)
                .rotationEffect(.degrees(-45))
                .foregroundStyle(.white)
                .padding(12)
                .background(.tripGray, in: Circle())

            Text("Airways")
                .font(.title2)
                .fontWeight(.medium)

            Spacer()

            HStack(spacing: 0) {
                Text("$")
                    .font(.caption)
                    .offset(y: -2)
                Text("\(ticket.price)")
                    .font(.title3)
            }
            .fontWeight(.semibold)
        }
    }

    private var footerView: some View {
        VStack(spacing: 14) {
            deparetureArrivalHeader
                .padding(.horizontal)

            VStack(spacing: 12) {
                ForEach(ticket.routePlan) { route in
                    deparetureArrivalRow(route)
                }
            }
        }
    }

    private var deparetureArrivalHeader: some View {
        HStack {
            Text("Departure")
            Spacer()
            Text("Arrive")
        }
        .font(.footnote)
        .foregroundStyle(.tripGray)
    }

    private func deparetureArrivalRow(_ route: RoutePlan) -> some View {
        VStack {
            HStack {
                flightInfoView(route.departureTime, route.departure)

                FlightPathView(duration: "5h 30m")
                    .padding(.horizontal, 36)
                    .offset(y: 6)

                flightInfoView(route.arrivalTime, route.arrival)
            }
            .padding(.horizontal)
        }
    }

    private func flightInfoView(_ time: String, _ location: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(time)
            Text(location)
                .foregroundStyle(.tripGray)
        }
        .font(.footnote)
        .fontWeight(.semibold)
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    AirwaysTicketView(ticket: appData.tickets[0])
}
