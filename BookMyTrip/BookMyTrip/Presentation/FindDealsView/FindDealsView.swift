//
//  FindDealsView.swift
//  BookMyTrip
//
//  Created by 김건우 on 4/30/25.
//

import SwiftUI

struct FindDealsView: View {
    
    @State private var searchQuery: String = ""
    
    var navigationLinkArray: [FindDealsNavigationLink] {
        FindDealsNavigationLink.allCases
    }
    
    var body: some View {
        TravelNavigationStack {
            VStack {
                topHeaderView
                    .padding()
                    .padding(.vertical, 6)

                textfieldView
                    .padding(.horizontal)
                    .padding(.bottom, 16)

                findDiealsButtonGroupView
                    .padding()
                    .padding(.bottom, 8)

                popularPlacesHeaderView
                    .padding()

                popularPlacesView
                    .padding(.bottom, 8)
            }
            .travelToolBarLayout(leadingToolbar:  {
                TravelToolBarItem(.line3HorizontalDecrease) {
                } // TODO: 햄버거 버튼 수정하기
                .scaleEffect(y: 1.25)
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
                    .offset(x: -1, y: 1)
                }
        }
    }

    var textfieldView: some View {
        HStack {
            Image(symbol: .magnifyingGlass)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(Color.travelGray)
                .padding(.leading, 7.5)

            TextField(
                "SearchQuery",
                text: $searchQuery,
                prompt: Text("Search Flight, Hotels, etc...")
                    .font(.subheadline)
                    .foregroundStyle(Color.travelGray)
            )
            .tint(Color.travelGray)
        }
        .padding()
        .background(Color.travelSecondary, in: Capsule())
    }

    var findDiealsButtonGroupView: some View {
        HStack {
            ForEach(
                Array(navigationLinkArray.enumerated()),
                id: \.offset
            ) { index, link in
                NavigationLink {
                    link.makeDestinationView()
                } label: {
                    FindDealsButton(link: link) { }
                }

                if index != FindDealsNavigationLink.allCases.count - 1 {
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
