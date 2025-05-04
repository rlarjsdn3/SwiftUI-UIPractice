//
//  FindDealsView.swift
//  BookMyTrip
//
//  Created by 김건우 on 4/30/25.
//

import SwiftUI

struct FindDealsView: View {
    
    @State private var searchQuery: String = ""

    #warning("검색창 클릭 시 뷰를 움직이지 않게 하기")
    #warning("리팩토링 시도")
    private var navigationLinkArray: [FindDeals] {
        FindDeals.allCases
    }
    
    var body: some View {
        TripNavigationStack {
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
                TripToolBarItem(.shape(.hamburger)) { }
            })
        }
    }
}

extension FindDealsView {

    private var navigationHeaderView: some View {
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
                .foregroundStyle(.white)
                .padding(14)
                .background(.tripLightPurple, in: .circle)
                .overlay(alignment: .topTrailing) {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 12, height: 12)

                        Circle()
                            .fill(.tripBlue)
                            .frame(width: 7.5, height: 7.5)
                    }
                    .offset(x: -2, y: 2)
                }
        }
    }

    private var findDiealsButtonGroupView: some View {
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
                            .foregroundStyle(.label)
                    }

                }

                if index != FindDeals.allCases.count - 1 {
                    Spacer()
                }
            }
        }
    }

    private var popularPlacesHeaderView: some View {
        HStack {
            Text("Popular Places")
                .font(.headline)
                .fontWeight(.bold)

            Spacer()

            Button("View All") { }
                .fontWeight(.medium)
                .foregroundStyle(.tripGray)
        }
    }

    private var popularPlacesView: some View {
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

#Preview {
    FindDealsView()
}
