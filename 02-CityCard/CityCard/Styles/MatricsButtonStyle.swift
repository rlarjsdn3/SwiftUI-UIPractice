//
//  ButtonStyle.swift
//  CityCard
//
//  Created by 김건우 on 2023/01/26.
//

import SwiftUI

struct MatricsButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            .frame(width: 80, alignment: .leading)
            .font(.caption)
            .background(.white)
            .cornerRadius(8)
            .foregroundColor(.gray)
            .overlay {
                if configuration.isPressed {
                    Color(white: 0, opacity: 0.2)
                }
            }
    }
}

struct ButtonStyle_Previews: PreviewProvider {
    static let city: City = CityModel().cities[0]
    
    static var previews: some View {
        MatricsButton(city: city, buttonType: .favorite)
            .buttonStyle(MatricsButtonStyle())
    }
}
