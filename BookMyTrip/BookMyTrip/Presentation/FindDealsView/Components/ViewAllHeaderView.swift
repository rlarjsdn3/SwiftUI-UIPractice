//
//  ViewAllHeaderView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct ViewAllHeaderView: View {
    
    let label: String
    let action: () -> Void
    
    init(_ label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }
    
    var body: some View {
        HStack {
            Text(label)
                .font(.headline)
                .fontWeight(.bold)

            Spacer()

            Button("View All") {
                action()
            }
            .fontWeight(.medium)
            .foregroundStyle(Color.travelGray)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ViewAllHeaderView("Popular places") { }
}
