//
//  MatricsLabel.swift
//  CityCard
//
//  Created by 김건우 on 2023/01/26.
//

import SwiftUI

struct MatricsButton: View {
    @EnvironmentObject var cityModel: CityModel
    
    var city: City
    var buttonType: MatricsButtonType
    
    var cityIndex: Int {
        cityModel.cities.firstIndex { $0.id == city.id }!
    }
    
    var body: some View {
        switch buttonType {
        case .favorite:
            Button {
                withAnimation(.linear(duration: 0)) {
                    if cityModel.cities[cityIndex].favoriteToggle() {
                        cityModel.cities[cityIndex].increasseFavorite()
                    } else {
                        cityModel.cities[cityIndex].decreaseFavorite()
                    }
                }
            } label: {
                Label(cityModel.cities[cityIndex].favoriteCount.formatted(), systemImage: buttonType.rawValue)
                    .foregroundColor(cityModel.cities[cityIndex].isFavorite ? buttonType.pressedColor : .gray)
            }
            .buttonStyle(MatricsButtonStyle())
        
        case .travel:
            Button {
                withAnimation(.linear(duration: 0)) {
                    if cityModel.cities[cityIndex].travelToggle() {
                        cityModel.cities[cityIndex].increasseTravel()
                    } else {
                        cityModel.cities[cityIndex].decreaseTravel()
                    }
                }
            } label: {
                Label(cityModel.cities[cityIndex].travelCount.formatted(), systemImage: buttonType.rawValue)
                    .foregroundColor(cityModel.cities[cityIndex].isTravel ? buttonType.pressedColor : .gray)
            }
            .buttonStyle(MatricsButtonStyle())
        }
    }
}

struct MatricsButton_Previews: PreviewProvider {
    static let city: City = CityModel().cities[0]
    
    static var previews: some View {
        MatricsButton(city: city, buttonType: .favorite)
            .environmentObject(CityModel())
    }
}
