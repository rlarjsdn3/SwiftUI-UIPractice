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
        TripNavigationStack {
            VStack {
                tripHeadlineView
                    .padding()
                    .padding(.vertical, 12)

                ticketsScrollView

                Spacer()

                checkoutButton
                    .padding(.horizontal)
            }
            .travelNavigationBarTitle("Select Ticket")
            .travelToolBarLayout {
                TripToolBarItem(.symbol(.chevronLeft)) {
                    dismiss()
                }
            } trailingToolBar: {
                TripToolBarItem(.shape(.hamburger)) { }
            }
        }
    }
    
    
    private var tripHeadlineView: some View {
        VStack(alignment: .leading, spacing: -2) {
            Text("Your Trip")
                .font(.footnote)
                .foregroundStyle(.tripGray)
            HStack {
                Text("SFO - NYC")
                    .font(.title2)
                    .fontWeight(.bold)
                TripTypeButton(.oneWay)
                    .disabled(true)
                    .scaleEffect(0.8)
            }
            Text(Date.now.format(.dMMMMyyyy))
                .font(.footnote)
                .foregroundStyle(.tripGray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var ticketsScrollView: some View {
        VStack(spacing: 30) {
            ForEach(appData.tickets) { ticket in
                AirwaysTicketView(ticket: ticket)
                    .padding(.horizontal)
            }
        }
    }
    
    private var checkoutButton: some View {
        MainActionButton("Checkout") { }
            .shadow(.tripPurple, opacity: 0.55)
    }
}

#Preview {
    SelectTicketView()
}
