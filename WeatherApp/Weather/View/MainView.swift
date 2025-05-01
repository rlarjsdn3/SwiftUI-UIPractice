//
//  MainView.swift
//  Weather
//
//  Created by 김건우 on 2023/02/09.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var service: WeatherService
    
    var body: some View {
        ZStack {
            BackgroundImageView()
            
            if service.updating {
                ProgressView()
            } else if let _ = service.lastError {
                ErrorView()
            } else {
                WeatherContentView()
            }
        }
        .onAppear {
            service.fetch()
        }
        .animation(.easeInOut, value: service.updating)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(WeatherService.preview)
    }
}
