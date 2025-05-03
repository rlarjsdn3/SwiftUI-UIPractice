//
//  BooksYourFlightView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

#warning("dateFormatter를 Date Extension으로 빼보기")

let dateFormtter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "d MMMM yyyy"
    return formatter
}()

struct BooksYourFlightView: View {

    @Environment(\.dismiss) var dismiss: DismissAction

    @State private var selectedTripType: TripWay = .oneWay

    var body: some View {
        TravelNavigationStack {
            VStack(spacing: 0) {
                tripTypeButtonGroup
                    .padding(.horizontal)
                    .padding(.top, 16)
                    .padding(.bottom, 8)

                VStack(spacing: 18) {
                    routSelectionView
                        .padding([.top, .horizontal])
                    
                    passengetSelectionView
                        .padding(.horizontal)
                    
                    departuresSelectionView
                        .padding(.horizontal)
                    
                    searchTheFlightButton
                        .padding(.horizontal)
                        .padding(.bottom, 10)

                    ViewAllHeaderView("Recommended") { }
                        .padding(.horizontal)

                    flightCardsScrollView
                }
            }
            .travelNavigationBarTitle("Book Your Flight")
            .travelNavigationBarTitleDisplayMode(.large)
            .travelToolBarLayout {
                #warning("ToolbarItem 코드 리팩토링")
                TravelToolBarItem(.chevronLeft) { // TODO: ToolbarItem 코드 리팩토링
                    dismiss()
                }
            } trailingToolBar: {
#warning("ToolbarItem 코드 리팩토링")
                TravelToolBarItem(Hamburger().eraseToAnyShape()) {
                } // TODO: ToolbarItem 코드 리팩토링
                .frame(width: 25, height: 20)
            }
        }
    }
    
    private var tripTypeButtonGroup: some View {
        HStack(spacing: 20) {
            ForEach(TripWay.allCases) { type in
                TripWayButton(type, selectedTripType: $selectedTripType) { }
            }
            Spacer()
        }
    }
    
    private var swaipLocationButton: some View {
        Button {
        } label: {
            Image(symbol: .arrowUpDown)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 55, height: 55)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.travelPurple)
                }
        }
        .shadow(Color.travelPurple)
    }
    
    private var routSelectionView: some View {
        VStack(spacing: 18) {
            TripOptionView("From") {
                Text("San Fancisco")
            } leadingIcon: {
                DepartureIconView()
            }
            .frame(height: 74)

            TripOptionView("Destination") {
                Text("New York")
            } leadingIcon: {
                ArrivalIconView()
            }
            .frame(height: 74)
        }
        .overlay(alignment: .trailing) {
            swaipLocationButton
                .padding(.trailing, 36)
        }
    }
    
    private var passengetSelectionView: some View {
        HStack(spacing: 20) {
            TripOptionView(
                "Passengers",
                spacing: 14,
                cornerRaduis: 12,
                edgeInsets: EdgeInsets(vertical: 12, horizontal: 12)) {
                    #warning("메뉴로 수정")
                    Text("2 Adults")
                } leadingIcon: {
                    Image(symbol: .calendar)
                        .font(.title3)
                        .foregroundStyle(Color.travelGray)
                }

            TripOptionView("")
                .hidden()
        }
    }
    
    private var departuresSelectionView: some View {
        HStack(spacing: 20) {
            TripOptionView(
                "Departures",
                spacing: 16,
                cornerRaduis: 12,
                edgeInsets: EdgeInsets(vertical: 12, horizontal: 12)) {
#warning("메뉴로 수정")
                    Text("8 August 2020")
                        .font(.caption)
                        .frame(height: 18)
                } leadingIcon: {
                    Image(symbol: .personFill)
                        .font(.title3)
                        .foregroundStyle(Color.travelGray)
                }

            TripOptionView(
                "Class",
                spacing: 14,
                cornerRaduis: 12,
                edgeInsets: EdgeInsets(vertical: 12, horizontal: 12)) {
#warning("메뉴로 수정")
                    Text("Business")
                } leadingIcon: {
                    Image(symbol: .chairLoungeFill)
                        .font(.title3)
                        .foregroundStyle(Color.travelGray)
                }
        }
    }
    
    private var searchTheFlightButton: some View {
        HStack(spacing: 18) {
            TripOptionView(
                cornerRaduis: 14,
                edgeInsets: EdgeInsets(vertical: 17, horizontal: 17),
                leadingIcon: {
                    Image(asset: .discount)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(Color.travelGray)
                        .frame(width: 22, height: 22)
                })

            MainActionButton("Search The Flight") { }
            
            TripOptionView(
                edgeInsets: EdgeInsets(vertical: 17, horizontal: 17),
                leadingIcon: {
                    Image(asset: .discount)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(Color.travelGray)
                        .frame(width: 22, height: 22)
                }
            )
            .hidden()
        }
    }
    
    private var flightCardsScrollView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(appData.recommendedFlights) { flight in
                    NavigationLink {
                        SelectTicketView()
                    } label: {
                        RecommendedFlightCard(flight: flight)
                    }
                }
            }
            .padding(.horizontal)
        }
        .scrollClipDisabled(true)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    BooksYourFlightView()
}
