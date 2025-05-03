//
//  PopularPlaceCard.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct PopularPlaceCard: View {
    
    let place: PopularPlace
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 27.5)
                .fill(.tripSecondary)
            
            placeContentView
                .padding(15)
        }
        .background {
            RoundedRectangle(cornerRadius: 27.5)
                .shadow()
        }
        .overlay {
            RoundedRectangle(cornerRadius: 27.5)
                .stroke(.tripStroke, lineWidth: 1)
        }
    }
    
    
    private var placeContentView: some View {
        VStack {
            placeImageView
                .padding(.bottom, 12.5)
            
            placeInfoView
                .padding(.bottom, 17.5)
        }
    }
    
    private var placeImageView: some View {
        GeometryReader { geo in
            Image(place.resource)
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width)
                .clipShape(RoundedRectangle.cornerRadius20)
                .overlay(alignment: .topTrailing) {
                    Image(symbol: .bookmarkFill)
                        .font(.caption)
                        .foregroundStyle(.white)
                        .padding(5)
                        .background(
                            .white.opacity(0.5),
                            in: .circle
                        )
                        .padding(12.5)
                }
        }
    }
    
    private var placeInfoView: some View {
        VStack(alignment: .leading) {
            Text(place.title)
                .font(.title3)
                .fontWeight(.bold)

            Text("Distance to \(String(format: "%.2f", place.distance)) mi")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

}


// MARK: - Previews

#Preview(traits: .fixedLayout(width: 400, height: 375)) {
    PopularPlaceCard(place: appData.popularPlaces[0])
        .frame(width: 250, height: 325)
}
