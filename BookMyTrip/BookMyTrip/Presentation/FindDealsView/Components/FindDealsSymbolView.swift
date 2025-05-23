//
//  FindDealsIcon.swift
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

    var symbol: MySymbol {
        switch self {
        case .airplane: return .airplane
        case .taxi:     return .carFill
        case .hotel:    return .buildingFill
        case .ellipsis: return .ellipsis
        }
    }

    var tint: Color {
        switch self {
        case .airplane: return .tripPurple
        case .taxi:     return .tripYellow
        case .hotel:    return .tripOrange
        case .ellipsis: return .tripBlue
        }
    }
}
extension FindDeals: Identifiable {
    var id: Self { self }
}


struct FindDealsSymbolView: View {

    private let link: FindDeals

    init(link: FindDeals) {
        self.link = link
    }
    
    var body: some View {
        Group {
            if link.symbol == .airplane {
                Image(symbol: link.symbol)
                    .rotationEffect(.degrees(-45))
            } else {
                Image(symbol: link.symbol)
            }
        }
        .font(.title3)
        .foregroundStyle(.white)
        .frame(width: 62.5, height: 62.5)
        .cornerRadius(link.tint, cornerRadius: 20)
        .padding(.bottom, 4)
        .shadow(link.tint, opacity: 0.44)
    }
}


#Preview {
    FindDealsSymbolView(link: FindDeals.airplane)
}
