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
                navigationHeaderView
                    .padding()
                    .padding(.top, 20)
                    .padding(.bottom, 14)

                CapsuleSearchBar(searchQuery: $searchQuery)
                    .padding(.horizontal)
                    .padding(.bottom, 24)

                findDiealsButtonGroupView
                    .padding()
                    .padding(.bottom, 12)

                ViewAllHeaderView("Popular places") { }
                    .padding()
                    .padding(.bottom, 6)

                popularPlacesView
                    .padding(.bottom, 2)
            }
            .travelToolBarLayout(leadingToolbar: {
                TravelToolBarItem(Hamburger().eraseToAnyShape()) { }
                    .frame(width: 25, height: 20)
            })
        }
    }
    
    

    var navigationHeaderView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
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
                .background(Color.travelLightPurple, in: .circle)
                .overlay(alignment: .topTrailing) {
                    ZStack {
                        Circle()
                            .fill(.white)
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
                NavigationLink {
                    BooksYourFlightView()
                } label: {
                    VStack {
                        FindDealsSymbolView(link: link)
                        
                        Text(link.title)
                            .font(.subheadline)
                            .foregroundStyle(Color.label)
                    }
                    
                }

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
                    PopularPlaceCard(place: place)
                        .frame(width: 260)
                        .frame(minHeight: 260, maxHeight: 340)
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
