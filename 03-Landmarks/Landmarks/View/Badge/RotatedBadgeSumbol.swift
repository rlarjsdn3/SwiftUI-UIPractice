//
//  RotatedBadgeSumbol.swift
//  Landmarks
//
//  Created by 김건우 on 2023/01/29.
//

import SwiftUI

struct RotatedBadgeSumbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSumbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSumbol(angle: Angle(degrees: 5))
    }
}
