//
//  OptionButton.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct OptionButton: View {

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
                    .foregroundStyle(isSelected ? Color.white : Color.tripGray)
                    .background {
                        Circle()
                            .fill(isSelected ? tint : Color.tripGray.opacity(0.11))
                            .frame(width: 24, height: 24)
                    }

                Text(label)
                    .font(.footnote)
                    .foregroundStyle(isSelected ? Color.tripPurple : Color.tripGray)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background(Color.tripSecondary, in: Capsule())
        }
    }
}


#Preview("One Way", traits: .sizeThatFitsLayout) {
    OptionButton(
        label: "One Way",
        icon: .arrowRight,
        tint: .tripPurple,
        isSelected: false,
        action: {}
    )
}

#Preview("Round Trip", traits: .sizeThatFitsLayout) {
    OptionButton(
        label: "Round Trip",
        icon: .arrowLeftRight,
        tint: .tripPurple,
        isSelected: true,
        action: {}
    )
}
