//
//  PrimaryButton.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/3/25.
//

import SwiftUI

struct PrimaryButton: View {
    var label: String
    var tintColor: Color
    var action: () -> Void

    init(
        _ label: String,
        tintColor: Color = Color.travelPurple,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.tintColor = tintColor
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(18)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.travelPurple)
                }
        }
    }
}

#Preview {
    PrimaryButton("Checkout") { }
}
