//
//  WeatherService.swift
//  Weather
//
//  Created by 김건우 on 2023/02/13.
//

import Foundation
import CoreLocation

class WeatherService: NSObject, ObservableObject {
    static let apiKey = "1701ddb4f85b51f499737b01bec805ec"
    
    let locationManager: CLLocationManager
    
    @Published var currentLocation: String?
    
    @Published var currentWeather: CurrentWeather?
    @Published var forecastList: [Forecast]?
    
    @Published var lastError: String?
    
    @Published var updating: Bool
    
    let isPreview: Bool
    
    init(preview: Bool = false) {
        self.isPreview = preview
        self.updating = false
        
        self.locationManager = CLLocationManager()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
        super.init()
        
        self.locationManager.delegate = self
    }
    
    static var preview: WeatherService {
        let service = WeatherService(preview: true)
        service.currentLocation = "양천구"
        service.currentWeather = CurrentWeather.preivew
        service.forecastList = Forecast.preview
        return service
    }
    
    func fetch() {
        guard !isPreview else { return }
        
        updating = true
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .denied, .restricted:
            lastError = "위치 서비스 사용 권한이 없습니다."
            updating = false
        default:
            lastError = "알 수 없는 오류"
            updating = false
        }
    }
}
