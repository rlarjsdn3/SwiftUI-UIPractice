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
                .fill(Color.travelSecondary)

            VStack {
                GeometryReader { geo in
                    placeImage(geo.frame(in: .local).width)
                        .padding(.bottom, 12.5)
                }

                VStack(alignment: .leading) {
                    Text(place.title)
                        .font(.title3)
                        .fontWeight(.bold)

                    Text("Distance to \(String(format: "%.2f", place.distance)) mi")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 17.5)
            }
            .padding(15)
        }
        .background(
            RoundedRectangle(cornerRadius: 27.5)
                .commonShadow()
        )
        .overlay {
            RoundedRectangle(cornerRadius: 27.5)
                .stroke(Color.travelStroke, lineWidth: 1)
        }
    }
    

    func placeImage(_ width: CGFloat) -> some View {
        Image(place.resource)
            .resizable()
            .scaledToFill()
            .frame(width: width)
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


// MARK: - Previews

#Preview(traits: .fixedLayout(width: 400, height: 375)) {
    PopularPlaceCard(place: appData.popularPlaces[0])
        .frame(width: 250, height: 325)
}
