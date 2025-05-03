//
//  AirwaysTicketView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct AirwaysTicketView: View {
    let ticket: Ticket

    var body: some View {
        TicketView {
            HStack {
                Image(symbol: .airplane)
                    .rotationEffect(.degrees(-45))
                    .foregroundStyle(Color.white)
                    .padding(12)
                    .background(Color.travelGray, in: Circle())

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
            .padding(.top, 6)
            .padding(.horizontal, 24)

        } footerView: {
            VStack(spacing: 14) {
                HStack {
                    Text("Departure")
                    Spacer()
                    Text("Arrive")
                }
                .font(.footnote)
                .foregroundStyle(Color.travelGray)
                .padding(.horizontal)

                VStack(spacing: 12) {
                    ForEach(ticket.routePlan) { route in
                        VStack {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(route.departureTime)

                                    Text(route.departure)
                                        .foregroundStyle(Color.travelGray)
                                }
                                .font(.footnote)
                                .fontWeight(.semibold)

                                TravelDurationView(duration: "5h 30m")
                                    .padding(.horizontal, 30)
                                    .offset(y: 6)
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(route.arrivalTime)
                                    Text(route.arrival)
                                        .foregroundStyle(Color.travelGray)
                                }
                                .font(.footnote)
                                .fontWeight(.semibold)
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
            .padding(.top, 22)
            .padding(.bottom, 20)
        }
    }
}
