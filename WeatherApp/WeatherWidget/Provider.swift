//
//  Provider.swift
//  Weather
//
//  Created by 김건우 on 2023/02/16.
//

import Foundation
import WidgetKit

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> WeatherEntry {
        WeatherEntry(widgetData: .preview)
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (WeatherEntry) -> ()) {
        var data = WidgetData.preview
        
        if !context.isPreview {
            let list = WidgetData.read()
            if !list.isEmpty {
                data = list[0]
            }
        }
        
    
        let entry = WeatherEntry(widgetData: data)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<WeatherEntry>) -> ()) {
        var entries = WidgetData.read().map {
            WeatherEntry(widgetData: $0)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
