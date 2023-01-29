//
//  BackgroundImage.swift
//  CityCard
//
//  Created by 김건우 on 2023/01/26.
//

import SwiftUI

struct BackgroundImage: View {
    var image: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            LinearGradient(
                gradient: Gradient(colors: [Color(white: 0, opacity: 0.75), .clear]),
                startPoint: .topLeading,
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
        }
    }
}

struct BackgroundImage_Previews: PreviewProvider {
    static let city: City = CityModel().cities[0]
    
    static var previews: some View {
        BackgroundImage(image: city.image)
    }
}
