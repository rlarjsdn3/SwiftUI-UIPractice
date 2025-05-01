//
//  MapPinImage.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct MapPinImage: View {
    var body: some View {
        Image("map-pin")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
    }
}

#Preview("Map-Pin Image", traits: .sizeThatFitsLayout) {
    MapPinImage()
        .frame(width: 64, height: 64)
        .foregroundStyle(Color.travelOrange)
}
