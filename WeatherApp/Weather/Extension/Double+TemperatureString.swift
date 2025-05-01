//
//  Double+TemperatureString.swift
//  Weather
//
//  Created by 김건우 on 2023/02/09.
//

import Foundation

fileprivate var formatter: MeasurementFormatter {
    let f = MeasurementFormatter()
    f.numberFormatter.maximumFractionDigits = 0
    f.unitOptions = .temperatureWithoutUnit
    return f
}

extension Double {
    var temperatureString: String {
        let temperature = Measurement<UnitTemperature>(value: self, unit: .celsius)
        return formatter.string(from: temperature)
    }
    
    static var randomTemperature: String {
        return Double.random(in: -10...30).temperatureString
    }
}
