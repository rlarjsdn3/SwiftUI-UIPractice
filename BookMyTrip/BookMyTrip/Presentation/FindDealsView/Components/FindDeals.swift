//
//  FindDeals.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

enum FindDeals: String, CaseIterable {
    case airplane
    case hotel
    case taxi
    case ellipsis
    
    var title: String {
        switch self {
        case .airplane: return "Flight"
        case .taxi:     return "Taxi"
        case .hotel:    return "Hotel"
        case .ellipsis: return "More"
        }
    }
    
    var symbol: SFSymbol {
        switch self {
        case .airplane: return .airplane
        case .taxi:     return .carFill
        case .hotel:    return .buildingFill
        case .ellipsis: return .ellipsis
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .airplane: return .travelPurple
        case .taxi:     return .travelOrange
        case .hotel:    return .travelYellow
        case .ellipsis: return .travelBlue
        }
    }
    
    @ViewBuilder
    func makeDestinationView() -> some View {
        switch self {
        case .airplane: BooksYourFlightView()
        case .taxi:     BooksYourFlightView()
        case .hotel:    BooksYourFlightView()
        case .ellipsis: BooksYourFlightView()
        }
    }
}

extension FindDeals: Identifiable {
    var id: Self { self }
}
