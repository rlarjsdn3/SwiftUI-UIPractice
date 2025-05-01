//
//  WeatherContentView.swift
//  Weather
//
//  Created by 김건우 on 2023/02/13.
//

import SwiftUI

struct WeatherContentView: View {
    @EnvironmentObject var service: WeatherService
    
    var body: some View {
        VStack {
            Text(service.currentLocation ?? "nil")
                .font(.title2)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
            
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack {
                        Color.clear
                        CurrentWeatherView(model: service.currentWeather)
                    }
                    .frame(height: geometry.size.height)
                    
                    Spacer(minLength: geometry.safeAreaInsets.bottom)
                    
                    ForcastView()
                }
            }
        }
    }
}

struct WeatherContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherContentView()
            .preferredColorScheme(.dark)
            .environmentObject(WeatherService.preview)
    }
}
