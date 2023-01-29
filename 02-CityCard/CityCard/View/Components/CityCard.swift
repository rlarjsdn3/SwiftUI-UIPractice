//
//  CityCard.swift
//  CityCard
//
//  Created by 김건우 on 2023/01/26.
//

import SwiftUI

enum MatricsButtonType: String {
    case favorite = "heart.fill"
    case travel = "airplane"
    
    var pressedColor: Color {
        switch self {
        case .favorite:
            return .red
        case .travel:
            return .cyan
        }
    }
}

struct CityCard: View {
    var city: City
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text(city.name)
                    .font(.system(.largeTitle, weight: .bold))
                Text(city.country)
                    .font(.subheadline)
            }
            .foregroundColor(.white)
            
            HStack {
                MatricsButton(city: city, buttonType: .favorite)
                MatricsButton(city: city, buttonType: .travel)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(BackgroundImage(image: city.image))
        .cornerRadius(16)
        .shadow(color: .gray, radius: 8, x: 4, y: 4)
    }
}

struct CityCard_Previews: PreviewProvider {
    static let city: City = CityModel().cities[0]
    
    static var previews: some View {
        CityCard(city: city)
    }
}
