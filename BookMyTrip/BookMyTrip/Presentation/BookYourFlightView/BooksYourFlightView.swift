//
//  BooksYourFlightView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct BooksYourFlightView: View {

    @Environment(\.dismiss) var dismiss: DismissAction

    var body: some View {
        TravelNavigationStack {
            VStack(spacing: 0) {

            }
            .travelNavigationBarTitle("Book Your Flight")
            .travelNavigationBarTitleDisplayMode(.large)
            .travelToolBarLayout {
                TravelToolBarItem(.chevronLeft) {
                    dismiss()
                }
            } trailingToolBar: {
                TravelToolBarItem(
                    Hamburger().eraseToAnyShape()
                ) { }
                    .frame(width: 25, height: 20)
            }
        }
    }
}

#Preview {
    BooksYourFlightView()
}
