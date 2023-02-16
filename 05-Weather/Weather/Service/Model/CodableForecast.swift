//
//  CodableForcast.swift
//  Weather
//
//  Created by 김건우 on 2023/02/15.
//

import Foundation

struct CodableForecast: Codable {
    let list: [List]
    struct List: Codable {
        let dt: Double
        
        let main: Main
        struct Main: Codable {
            var temp: Double
            let temp_min: Double
            let temp_max: Double
        }
        
        var weather: [Weather]
        struct Weather: Codable {
            let description: String
            let icon: String
        }
    }
}
