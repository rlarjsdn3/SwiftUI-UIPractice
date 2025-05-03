//
//  TemplateImage.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

@available(*, deprecated, message: "삭제될 코드")
struct TemplateImage: View {
    let asset: MyAsset

    var body: some View {
        Image(asset: asset)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
    }
}

#Preview("MapPin", traits: .sizeThatFitsLayout) {
    TemplateImage(asset: .mapPin)
        .frame(width: 64, height: 64)
        .foregroundStyle(Color.travelOrange)
}
