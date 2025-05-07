//
//  FlightArrivalIconView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct FlightArrivalIconView: View {
    
    var body: some View {
        VStack(spacing: 3) {
            VerticalLine(lineCap: .round, dash: [1, 2])
            Image(asset: .mapPin)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.tripGray)
                .frame(width: 15, height: 15)
        }
        .foregroundStyle(Color.tripGray)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FlightArrivalIconView()
        .frame(height: 50)
}
