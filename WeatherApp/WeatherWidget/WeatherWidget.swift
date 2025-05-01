//
//  WeatherWidget.swift
//  WeatherWidget
//
//  Created by 김건우 on 2023/02/16.
//

import WidgetKit
import SwiftUI
import Intents

struct WeatherWidget: Widget {
    let kind: String = "WeatherWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            WeatherEntryView(entry: entry)
        }
        .configurationDisplayName("날씨 위젯")
        .description("현재 날씨를 확인할 수 있습니다.")
        .supportedFamilies([.systemSmall])
    }
}

struct WeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherEntryView(entry: WeatherEntry(widgetData: .preview))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
