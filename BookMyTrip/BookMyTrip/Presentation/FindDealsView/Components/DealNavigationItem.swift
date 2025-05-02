//
//  FindDealsIcon.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

#warning("ButtonIterable 프로토콜을 만들까?")

enum Deals: String, CaseIterable {
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
        case .airplane: return .travelPurple
        case .taxi:     return .travelYellow
        case .hotel:    return .travelOrange
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
extension Deals: Identifiable {
    var id: Self { self }
}

struct DealNavigationItem: View {
    var link: Deals

    init(link: Deals) {
        self.link = link
    }

    var body: some View {
        VStack {
            NavigationLink {
                link.makeDestinationView()
            } label: {
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
                .background(link.tint, in: RoundedRectangle(cornerRadius: 20))
                .commonShadow(link.tint,opacity: 0.44)
                .padding(.bottom, 4)

            }
            
            Text(link.title)
                .font(.subheadline)
                .foregroundStyle(Color.label)
        }
    }
}


#Preview {
    DealNavigationItem(link: Deals.airplane)
}
