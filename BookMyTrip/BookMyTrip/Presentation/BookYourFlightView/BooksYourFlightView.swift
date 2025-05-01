//
//  BooksYourFlightView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct BooksYourFlightView: View {
    var body: some View {
        TravelNavigationStack {
            Text("Hello, World!")
                .travelNavigationBarTitle("Book Your Flight")
                .travelNavigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    BooksYourFlightView()
}
