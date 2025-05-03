//
//  SelectTicketView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct SelectTicketView: View {

    @Environment(\.dismiss) var dismiss: DismissAction

    var body: some View {
        TravelNavigationStack {
            VStack {

                VStack(alignment: .leading, spacing: -2) {
                    Text("Your Trip")
                        .font(.footnote)
                        .foregroundStyle(Color.travelGray)
                    HStack {
                        Text("SFO - NYC")
                            .font(.title2)
                            .fontWeight(.bold)
                        TripWayButton(.oneWay)
                            .disabled(true)
                            .scaleEffect(0.8)
                    }
                    Text("5 July 2020")
                        .font(.footnote)
                        .foregroundStyle(Color.travelGray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.vertical, 12)


                VStack(spacing: 30) {
                    ForEach(appData.tickets) { ticket in
                        AirwaysTicketView(ticket: ticket)
                            .padding(.horizontal)
                    }
                }

                Spacer()

                PrimaryButton("Checkout") { }
                    .commonShadow(Color.travelPurple, opacity: 0.55)
                    .padding(.horizontal)

            }
            .travelNavigationBarTitle("Select Ticket")
            .travelToolBarLayout {
                TravelToolBarItem(.chevronLeft) { // TODO: ToolbarItem 코드 리팩토링
                    dismiss()
                }
            } trailingToolBar: {
                TravelToolBarItem(Hamburger().eraseToAnyShape()) {
                } // TODO: ToolbarItem 코드 리팩토링
                .frame(width: 25, height: 20)
            }
        }
    }
}

#Preview {
    SelectTicketView()
}
