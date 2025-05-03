//
//  MainActionButton.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/3/25.
//

import SwiftUI

struct MainActionButton: View {
    
    let label: String
    let tint: Color
    let action: () -> Void

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
                .background {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.tripPurple)
                }
        }
    }
}

#Preview {
    MainActionButton("Checkout") { }
}
