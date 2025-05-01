//
//  ForcastView.swift
//  Weather
//
//  Created by 김건우 on 2023/02/13.
//

import SwiftUI

struct ForcastView: View {
    @EnvironmentObject var service: WeatherService
    
    var body: some View {
        ForEach(service.forecastList ?? []) { forecast in
            HStack {
                VStack(alignment: .leading) {
                    Text(forecast.date)
                    Text(forecast.time)
                }
                .font(.caption)
                
                Spacer()
                
                Image(systemName: forecast.icon)
                    .font(.title3)
                    .symbolRenderingMode(.multicolor)
                Text(forecast.weather)
                    .font(.title3)
                
                Spacer()
                
                Text(forecast.temperature)
                    .font(.system(size: 40, weight: .ultraLight))
                    .frame(minWidth: 70, alignment: .trailing)
            }
            .foregroundColor(.white)
            .padding(.horizontal)
        }
    }
}

struct ForcastView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForcastView()
        }
        .preferredColorScheme(.dark)
        .environmentObject(WeatherService.preview)
    }
}
