//
//  CodableCurrentWeather.swift
//  Weather
//
//  Created by 김건우 on 2023/02/15.
//

import Foundation

struct CodableCurrentWeather: Codable {
    let dt: Double
    
    var weather: [Weather]
    struct Weather: Codable {
        let description: String
        let icon: String
    }
    
    var main: Main
    struct Main: Codable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
    }
    
    var sys: Sys
    struct Sys: Codable {
        let sunrise: Double
        let sunset: Double
    }
}
