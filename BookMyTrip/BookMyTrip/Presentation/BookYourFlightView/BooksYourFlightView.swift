//
//  BooksYourFlightView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct BooksYourFlightView: View {

    @Environment(\.dismiss) var dismiss: DismissAction

    @State private var selectedTripType: TripWay = .oneWay

    var body: some View {
        TravelNavigationStack {
            VStack(spacing: 0) {
                HStack(spacing: 20) {
                    ForEach(TripWay.allCases) { type in
                        TripWayButton(type, selectedTripType: $selectedTripType) { }
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
                
                VStack(spacing: 18) {
                    VStack(spacing: 18) {
                        TripOptionButton("From") {
                            Text("San Fancisco")
                        } leadingIcon: {
                            DepartureIndicator()
                        }
                        .frame(height: 80)
                        
                        TripOptionButton("Destination") {
                            Text("New York")
                        } leadingIcon: {
                            ArrivalIndicator()
                        }
                        .frame(height: 80)
                    }
                    .padding([.top, .horizontal])
                    .overlay(alignment: .trailing) {
                        Button {
                        } label: {
                            Image(symbol: .arrowUpDown)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: 60, height: 60)
                                .background {
                                    RoundedRectangle(cornerRadius: 17.5)
                                        .fill(Color.travelPurple)
                                }
                        }
                        .padding(.trailing, 36)
                        .commonShadow(Color.travelPurple)
                    }
                    
                    HStack(spacing: 20) {
                        TripOptionButton(
                            "Passengers",
                            spacing: 14,
                            edgeInsets: EdgeInsets(vertical: 12, horizontal: 14)) {
                                Text("2 Adults") // TODO: 선택 메뉴로 수정
                            } leadingIcon: {
                                Image(symbol: .calendar)
                                    .font(.title3)
                                    .foregroundStyle(Color.travelGray)
                            }
                        
                        TripOptionButton("")
                            .hidden()
                    }
                    .padding(.horizontal)
                    
                    HStack(spacing: 20) {
                        TripOptionButton(
                            "Departures",
                            spacing: 16,
                            edgeInsets: EdgeInsets(vertical: 12, horizontal: 14)) {
                                Text("8 August 2020") // TODO: - 캘린더 선택으로 수정
                                    .font(.caption)
                                    .frame(height: 18)
                            } leadingIcon: {
                                Image(symbol: .personFill)
                                    .font(.title3)
                                    .foregroundStyle(Color.travelGray)
                            }
                        
                        TripOptionButton(
                            "Class",
                            spacing: 14,
                            edgeInsets: EdgeInsets(vertical: 12, horizontal: 14)) {
                                Text("Business") // TODO: 선택 메뉴로 수정
                            } leadingIcon: {
                                Image(symbol: .chairLoungeFill)
                                    .font(.title3)
                                    .foregroundStyle(Color.travelGray)
                            }
                    }
                    .padding(.horizontal)
                    
                    HStack(spacing: 18) {

                        TripOptionButton(edgeInsets: .zero, leadingIcon: {
                            Image(symbol: .airplane) // TODO: 이미지 수정
                                .padding(18)
                        })
                        
                        Button {
                        } label: {
                            Text("Search The Flight")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding(18)
                                .frame(maxWidth: .infinity)
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.travelPurple)
                                }
                        }
                        
                        TripOptionButton(edgeInsets: .init(), leadingIcon: {
                            Image(symbol: .airplane) // TODO: 이미지 수정
                                .padding(18)
                        })
                        .hidden()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)

                    ViewAllHeaderView("Recommended") { }
                        .padding(.horizontal)
                    ScrollView(.horizontal) {
                        HStack {
#warning("추천 여행 스크롤 뷰 구현")
                            ForEach(appData.recommendedFlights) { flight in
                                Text(flight.date)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .scrollClipDisabled(false)
                }
                
                Spacer()
            }
            .travelNavigationBarTitle("Book Your Flight")
            .travelNavigationBarTitleDisplayMode(.large)
            .travelToolBarLayout {
                TravelToolBarItem(.chevronLeft) { // TODO: ToolbarItem 코드 리팩토링
                    dismiss()
                }
            } trailingToolBar: {
                TravelToolBarItem(Hamburger().eraseToAnyShape()) {
                } // TODO: ToolbarItem 코드 리팩토링
                .frame(width: 25, height: 20)
            }
        }
    }
}

#Preview {
    BooksYourFlightView()
}
