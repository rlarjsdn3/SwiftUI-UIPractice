//
//  ArrivalIndicator.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct ArrivalIndicator: View {
    var body: some View {
        VStack(spacing: 3) {
            VerticalLine(lineCap: .round, dash: [1, 2])
            MapPinImage()
                .frame(width: 20, height: 20)
        }
        .frame(width: 30)
        .foregroundStyle(Color.travelGray)
        .clipped()
    }
}

#Preview("Destination Side Image", traits: .sizeThatFitsLayout) {
    ArrivalIndicator()
        .frame(height: 50)
}
