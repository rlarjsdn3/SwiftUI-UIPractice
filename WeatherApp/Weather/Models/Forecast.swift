//
//  Forecast.swift
//  Weather
//
//  Created by 김건우 on 2023/02/09.
//

import Foundation

struct Forecast: Identifiable, Hashable {
    var id = UUID()
    
    let date: String
    let time: String
    let icon: String
    let weather: String
    let temperature: String
    let minTemperature: String
    let maxTemperature: String
    let forcastedDate: Date
}

extension Forecast {
    static var preview: [Forecast] {
        (0..<10).map {
            let dt = Date.now.addingTimeInterval(TimeInterval($0 * 3600 * 24))
            
            return Forecast(
                date: dt.formatted(.dateTime.month().day()),
                time: dt.formatted(.dateTime.hour().minute()),
                icon: "sun.max.fill",
                weather: "맑음",
                temperature: Double.randomTemperature,
                minTemperature: Double.randomTemperature,
                maxTemperature: Double.randomTemperature,
                forcastedDate: .now
            )
        }
    }
    
    init?(data: CodableForecast.List) {
        let dt = Date(timeIntervalSince1970: TimeInterval(data.dt))
        
        date = dt.formatted(.dateTime.month().day())
        time = dt.formatted(.dateTime.hour().minute())
        forcastedDate = dt
        
        guard let weatherData = data.weather.first else {
            return nil
        }
        
        icon = weatherData.icon.weatherImageName
        weather = weatherData.description
        
        temperature = data.main.temp.temperatureString
        minTemperature = data.main.temp_min.temperatureString
        maxTemperature = data.main.temp_max.temperatureString
    }
}
