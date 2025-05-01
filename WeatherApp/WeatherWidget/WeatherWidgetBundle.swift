//
//  WeatherWidgetBundle.swift
//  WeatherWidget
//
//  Created by 김건우 on 2023/02/16.
//

import WidgetKit
import SwiftUI

@main
struct WeatherWidgetBundle: WidgetBundle {
    var body: some Widget {
        WeatherWidget()
        WeatherWidgetLiveActivity()
    }
}
