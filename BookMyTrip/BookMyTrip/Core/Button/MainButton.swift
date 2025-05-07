//
//  MainButton.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/3/25.
//

import SwiftUI

struct MainButton: View {
    
    private let label: String
    private let tint: Color
    private let action: () -> Void

    init(
        _ label: String,
        tint: Color = Color.tripPurple,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.tint = tint
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
                .cornerRadius(.tripPurple, cornerRadius: 14)
        }
        .shadow(tint)
    }
}

#Preview {
    MainButton("Checkout") { }
}
