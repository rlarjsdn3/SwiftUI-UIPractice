//
//  ApplicationData.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct PopularPlace: Identifiable {
    let id = UUID()
    let title: String
    let distance: Double
    let resource: String
}

struct RecommendedFlight: Identifiable {
    let id = UUID()
    let date: Date
    let departure: String
    let arrival: String
    let price: Int
    let color: Color
}

struct Ticket: Identifiable {
    let id = UUID()
    let price: Int
    let routePlan: [RoutePlan]
}

struct RoutePlan: Identifiable {
    let id = UUID()
    let departure: String
    let departureTime: String
    let arrival: String
    let arrivalTime: String
    let duration: String
}

struct ApplicationData {
    let popularPlaces: [PopularPlace]
    let recommendedFlights: [RecommendedFlight]
    let tickets: [Ticket]

    init() {
        #warning("텍스트는 제시한 UI와 동일하게 작성")
        popularPlaces = [
            .init(title: "주상절리", distance: 1.45, resource: "columnar-joints"),
            .init(title: "설악산", distance: 6.54, resource: "seoraksan-mountain"),
            .init(title: "광화문", distance: 4.32, resource: "gwanghwamun-gate"),
            .init(title: "광안대교", distance: 9.43, resource: "gwangan-bridge"),
            .init(title: "경복궁", distance: 8.43, resource: "gyeongbokgung-palace"),
            .init(title: "동대문 디자인 플라자", distance: 5.32, resource: "dongdaemun-design-plaza")
        ]

        recommendedFlights = [
            .init(date: .now, departure: "SFC", arrival: "NYC", price: 2358, color: .tripBlue),
            .init(date: .now, departure: "SFC", arrival: "NYC", price: 3421, color: .tripPurple),
            .init(date: .now, departure: "SFC", arrival: "NYC", price: 6543, color: .tripOrange),
            .init(date: .now, departure: "SFC", arrival: "NYC", price: 1122, color: .tripYellow),
            .init(date: .now, departure: "SFC", arrival: "NYC", price: 1234, color: .tripBlue),
        ]

        tickets = [
            .init(
                price: 234,
                routePlan: [
                    .init(departure: "SFO", departureTime: "13.45", arrival: "NYC", arrivalTime: "22.15", duration: "5h 30m"),
                    .init(departure: "NYC", departureTime: "09.00", arrival: "SFO", arrivalTime: "12.10", duration: "6h 10m")
                ]),
            .init(
                price: 546,
                routePlan: [
                    .init(departure: "SFO", departureTime: "08.35", arrival: "NYC", arrivalTime: "16.40", duration: "5h 30m"),
                    .init(departure: "NYC", departureTime: "18.40", arrival: "SFO", arrivalTime: "21.38", duration: "5h 58m")
                ])
        ]
    }
}
let appData = ApplicationData()





