//
//  WeatherApp.swift
//  Weather
//
//  Created by 김건우 on 2023/02/09.
//

import SwiftUI

@main
struct WeatherApp: App {
    let service = WeatherService()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
                .environmentObject(service)
        }
    }
}
