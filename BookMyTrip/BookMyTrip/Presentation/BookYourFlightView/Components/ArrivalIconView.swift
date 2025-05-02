//
//  ArrivalIconView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct ArrivalIconView: View {
    var body: some View {
        VStack(spacing: 3) {
            VerticalLine(lineCap: .round, dash: [1, 2])
            TemplateImage(asset: .mapPin)
                .foregroundStyle(Color.travelGray)
                .frame(width: 15, height: 15)
        }
        .frame(width: 30)
        .foregroundStyle(Color.travelGray)
        .clipped()
    }
}

#Preview("Destination Side Image", traits: .sizeThatFitsLayout) {
    ArrivalIconView()
        .frame(height: 50)
}
