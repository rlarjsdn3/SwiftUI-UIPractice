//
//  CityCardApp.swift
//  CityCard
//
//  Created by 김건우 on 2023/01/26.
//

import SwiftUI

@main
struct CityCardApp: App {
    @StateObject var cityModel: CityModel = CityModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cityModel)
        }
    }
}
