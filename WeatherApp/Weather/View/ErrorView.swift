//
//  ErrorView.swift
//  Weather
//
//  Created by 김건우 on 2023/02/15.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var service: WeatherService
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.circle")
                .font(.largeTitle)
                .foregroundColor(.white)
            
            if let error = service.lastError {
                Text(error)
                    .foregroundColor(.white)
                    .padding()
            }
            
            Button("다시 요청하기") {
                service.lastError = nil
                service.fetch()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
            .preferredColorScheme(.dark)
            .environmentObject(WeatherService.preview)
    }
}
