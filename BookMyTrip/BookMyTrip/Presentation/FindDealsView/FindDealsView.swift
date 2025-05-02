//
//  FindDealsView.swift
//  BookMyTrip
//
//  Created by 김건우 on 4/30/25.
//

import SwiftUI

struct FindDealsView: View {
    
    @State private var searchQuery: String = ""
    
    var navigationLinkArray: [FindDeals] {
        FindDeals.allCases
    }
    
    var body: some View {
        TravelNavigationStack {
            VStack(spacing: 0) {
                topHeaderView
                    .padding()
                    .padding(.vertical, 14)

                RoundedTextField(searchQuery: $searchQuery)
                    .padding(.horizontal)
                    .padding(.bottom, 24)

                findDiealsButtonGroupView
                    .padding()
                    .padding(.bottom, 12)

                popularPlacesHeaderView
                    .padding()
                    .padding(.bottom, 6)

                popularPlacesView
                    .padding(.bottom, 2)
            }
            .travelToolBarLayout(leadingToolbar: {
                TravelToolBarItem( // TODO: 코드 리팩토링
                    Hamburger().eraseToAnyShape()
                ) { }
                    .frame(width: 25, height: 20)
            })

        }
    }
    
    
    // MARK: Subviews

    var topHeaderView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Hi, Robert")
                    .font(.title3)
                    .foregroundStyle(.secondary)

                Text("Find Deals")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }

            Spacer()

            Image(symbol: .personFill)
                .imageScale(.large)
                .foregroundStyle(Color.white)
                .padding(14)
                .background(Color.travelLightPurple, in: Circle())
                .overlay(alignment: .topTrailing) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 12, height: 12)

                        Circle()
                            .fill(Color.travelBlue)
                            .frame(width: 7.5, height: 7.5)
                    }
                    .offset(x: -2, y: 2)
                }
        }
    }

    var findDiealsButtonGroupView: some View {
        HStack {
            ForEach(
                Array(navigationLinkArray.enumerated()),
                id: \.offset
            ) { index, link in
                FindDealsNavigationLink(link: link)

                if index != FindDeals.allCases.count - 1 {
                    Spacer()
                }
            }
        }
    }

    var popularPlacesHeaderView: some View {
        HStack {
            Text("Popular Places")
                .font(.headline)
                .fontWeight(.bold)

            Spacer()

            Button("View All") { }
                .fontWeight(.medium)
                .foregroundStyle(Color.travelGray)
        }
    }

    var popularPlacesView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: -5) {
                ForEach(appData.popularPlaces) { place in
                    PopularPlaceCell(place: place)
                        .frame(width: 250)
                        .padding(.horizontal)
                }
            }
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled(true)
    }
}


// MARK: - Previews

#Preview {
    FindDealsView()
}
