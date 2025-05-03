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
                HStack(spacing: 20) {
                    ForEach(TripWay.allCases) { type in
                        TripWayButton(type, selectedTripType: $selectedTripType) { }
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 16)
                .padding(.bottom, 8)

                VStack(spacing: 18) {
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
                    .padding([.top, .horizontal])
                    .overlay(alignment: .trailing) {
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
                        .offset(y: 8)
                        .padding(.trailing, 36)
                        .commonShadow(Color.travelPurple)
                    }

                    HStack(spacing: 20) {
                        TripOptionView(
                            "Passengers",
                            spacing: 14,
                            cornerRaduis: 12,
                            edgeInsets: EdgeInsets(vertical: 12, horizontal: 12)) {
                                Text("2 Adults") // TODO: 선택 메뉴로 수정
                            } leadingIcon: {
                                Image(symbol: .calendar)
                                    .font(.title3)
                                    .foregroundStyle(Color.travelGray)
                            }

                        TripOptionView("")
                            .hidden()
                    }
                    .padding(.horizontal)

                    HStack(spacing: 20) {
                        TripOptionView(
                            "Departures",
                            spacing: 16,
                            cornerRaduis: 12,
                            edgeInsets: EdgeInsets(vertical: 12, horizontal: 12)) {
                                Text("8 August 2020") // TODO: - 캘린더 선택으로 수정
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
                                Text("Business") // TODO: 선택 메뉴로 수정
                            } leadingIcon: {
                                Image(symbol: .chairLoungeFill)
                                    .font(.title3)
                                    .foregroundStyle(Color.travelGray)
                            }
                    }
                    .padding(.horizontal)

                    HStack(spacing: 18) {

                        TripOptionView(
                            cornerRaduis: 14,
                            edgeInsets: EdgeInsets(vertical: 17, horizontal: 17),
                            leadingIcon: {
                                TemplateImage(asset: .discount)
                                    .foregroundStyle(Color.travelGray)
                                    .frame(width: 22, height: 22)
                            })

                        PrimaryButton("Search The Flight") { }

                        TripOptionView(
                            edgeInsets: EdgeInsets(vertical: 17, horizontal: 17),
                            leadingIcon: {
                                TemplateImage(asset: .discount)
                                    .foregroundStyle(Color.travelGray)
                                    .frame(width: 22, height: 22)
                            })
                        .hidden()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)

                    ViewAllHeaderView("Recommended") { }
                        .padding(.horizontal)

                    ScrollView(.horizontal) {
                        HStack(spacing: 30) {
                            ForEach(appData.recommendedFlights) { flight in
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image(symbol: .airplane)
                                            .font(.headline)
                                            .foregroundStyle(flight.color)
                                            .rotationEffect(.degrees(-45))
                                            .padding(6)
                                            .background(.white, in: RoundedRectangle(cornerRadius: 8))

                                        Spacer()
                                    }
                                    .padding(.bottom, 10)

                                    Text(dateFormtter.string(from: flight.date))
                                        .font(.caption2)
                                        .fontWeight(.light)
                                        .foregroundStyle(Color.white)

                                    HStack {
                                        Text(flight.departure)
                                            .fontWeight(.semibold)
                                        Image(symbol: .arrowLeftRight)
                                            .font(.caption2)
                                        Text(flight.arrival)
                                            .fontWeight(.semibold)
                                    }
                                    .foregroundStyle(.white)
                                    .padding(.bottom, 5)

                                    HStack(spacing: 0) {
                                        Text("$")
                                        Text("\(flight.price)")
                                    }
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                }
                                .padding(.horizontal, 12)
                                .frame(width: 140)
                                .frame(maxHeight: 150)
                                .background(
                                    LinearGradient(
                                        stops: [.init(color: flight.color.opacity(0.77), location: 0.0),
                                                .init(color: flight.color, location: 0.6),
                                                .init(color: flight.color, location: 1.0)],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    ),
                                    in: RoundedRectangle(cornerRadius: 20)
                                )
                                .commonShadow(flight.color, opacity: 0.55)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .scrollClipDisabled(true)
                    .scrollIndicators(.hidden)
                }
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

#warning("Passengers, Class 등 메뉴 선택 구현")
#warning("추천 여행 클릭하면 SelectTicketView로 이동")

#Preview {
    BooksYourFlightView()
}
