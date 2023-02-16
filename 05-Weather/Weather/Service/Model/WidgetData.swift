//
//  WidgetData.swift
//  Weather
//
//  Created by 김건우 on 2023/02/16.
//

import Foundation

struct WidgetData: Codable {
    let location: String
    let temperature: String
    let icon: String
    let weather: String
    let minTemperature: String
    let maxTemperature: String
    let date: Date
}

extension WidgetData {
    static let preview = WidgetData(
        location: "서울특별시 목동",
        temperature: Double.randomTemperature,
        icon: "sun.max.fill",
        weather: "맑음",
        minTemperature: Double.randomTemperature,
        maxTemperature: Double.randomTemperature,
        date: .now
    )
    
    static let dataURL = FileManager.sharedContainerURL.appendingPathComponent("widgetData.json")
    
    static func write(location: String?, currentWeather: CurrentWeather?, forecast: [Forecast]?) {
        guard let location = location, let currentWeather = currentWeather, let forecast = forecast else {
            return
        }
        
        var list = [WidgetData]()
        
        let data = WidgetData(
            location: location,
            temperature: currentWeather.temperature,
            icon: currentWeather.icon,
            weather: currentWeather.weather,
            minTemperature: currentWeather.minTemperature,
            maxTemperature: currentWeather.maxTemperature,
            date: currentWeather.forecastedDate
        )
        
        list.append(data)
        
        list.append(contentsOf: forecast.map {
            WidgetData(
                location: location,
                temperature: $0.temperature,
                icon: $0.icon,
                weather: $0.weather,
                minTemperature: $0.minTemperature,
                maxTemperature: $0.maxTemperature,
                date: $0.forcastedDate
            )
        })
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(list)
            try data.write(to: dataURL)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    static func read() -> [WidgetData] {
        var list = [WidgetData]()
        
        if let data = try? Data(contentsOf: dataURL) {
            do {
                let decoder = JSONDecoder()
                list = try decoder.decode([WidgetData].self, from: data)
            } catch {
                fatalError(error.localizedDescription)
            }
        }
        
        return list
    }
}
