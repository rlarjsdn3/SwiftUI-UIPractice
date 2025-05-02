//
//  TripTypeButton.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct TripTypeButton: View {

    let label: String
    let icon: MySymbol
    let tint: Color
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(symbol: icon)
                    .font(.caption2)
                    .foregroundStyle(isSelected ? Color.white : Color.travelGray)
                    .background {
                        Circle()
                            .fill(isSelected ? tint : Color.travelGray.opacity(0.11))
                            .frame(width: 24, height: 24)
                    }

                Text(label)
                    .font(.footnote)
                    .foregroundStyle(isSelected ? Color.travelPurple : Color.travelGray)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background(Color.travelSecondary, in: Capsule())
        }
    }
}


#Preview("One Way", traits: .sizeThatFitsLayout) {
    TripTypeButton(
        label: "One Way",
        icon: .arrowRight,
        tint: .travelPurple,
        isSelected: false,
        action: {}
    )
}

#Preview("Round Trip", traits: .sizeThatFitsLayout) {
    TripTypeButton(
        label: "Round Trip",
        icon: .arrowLeftRight,
        tint: .travelPurple,
        isSelected: true,
        action: {}
    )
}
