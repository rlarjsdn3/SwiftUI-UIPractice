//
//  Badge.swift
//  Landmarks
//
//  Created by 김건우 on 2023/01/29.
//

import SwiftUI

struct Badge: View {
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

extension Badge {
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSumbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
