//
//  WeatherEntry.swift
//  WeatherWidgetExtension
//
//  Created by 김건우 on 2023/02/16.
//

import Foundation
import WidgetKit

struct WeatherEntry: TimelineEntry {
    let widgetData: WidgetData
    
    var date: Date {
        widgetData.date
    }
}
