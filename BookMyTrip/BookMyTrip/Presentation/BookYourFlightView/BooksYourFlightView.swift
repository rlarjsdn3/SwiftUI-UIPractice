//
//  BooksYourFlightView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

enum FlightClassType: String, CaseIterable, Identifiable {
    var id: Self { self }
    case economy = "Economy"
    case business = "Business"
    case firstClass = "First"
}

struct BooksYourFlightView: View {

    @Environment(\.dismiss) var dismiss: DismissAction

    @State private var selectedTripType: TripType = .oneWay

    @State private var showPassengerSheet: Bool = false
    @State private var showDeparturesSheet: Bool = false
    @State private var showFlightClassSheet: Bool = false
    @State private var selectedPassengers: Int = 1
    @State private var selectedDepartures: Date = .now
    @State private var selectedClass: FlightClassType = .economy

    var body: some View {
        TripNavigationStack {
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
                TripToolBarItem(.symbol(.chevronLeft)) {
                    dismiss()
                }
            } trailingToolBar: {
                TripToolBarItem(.shape(.hamburger)) { }
            }
        }
        .bottomSheet(
            isPresented: $showPassengerSheet,
            image: .personFill,
            label: "Passengers"
        ) {
            passengersSheetView
        }
        .bottomSheet(
            isPresented: $showDeparturesSheet,
            image: .calendar,
            label: "Select Departures"
        ) {
            departuresSheetView
        }
        .bottomSheet(
            isPresented: $showFlightClassSheet,
            image: .chairLoungeFill,
            label: "Flight Class"
        ) {
            flightClassSheetView
        }
    }
}

extension BooksYourFlightView {

    private var tripTypeButtonGroup: some View {
        HStack(spacing: 20) {
            ForEach(TripType.allCases) { type in
                TripTypeButton(type, selectedTripType: $selectedTripType) { }
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
                .cornerRadius(.tripPurple, cornerRadius: 15)
        }
        .shadow(Color.tripPurple)
    }

    private var routSelectionView: some View {
        VStack(spacing: 18) {
            TripOptionView("From") {
                Text("San Fancisco")
            } leadingIcon: {
                FlightDepartureIconView()
            }
            .frame(height: 74)

            TripOptionView("Destination") {
                Text("New York")
            } leadingIcon: {
                FlightArrivalIconView()
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
                spacing: 16,
                cornerRaduis: 12,
                edgeInsets: EdgeInsets(vertical: 12, horizontal: 12)) {
                    Button("\(selectedPassengers) Adults") {
                        showPassengerSheet = true
                    }
                    .buttonStyle(.plain)
                } leadingIcon: {
                    Image(symbol: .personFill)
                        .font(.title3)
                        .foregroundStyle(.tripGray)
                }

            TripOptionView("")
                .hidden()
        }
    }

    private var departuresSelectionView: some View {
        HStack(spacing: 20) {
            TripOptionView(
                "Departures",
                spacing: 14,
                cornerRaduis: 12,
                edgeInsets: EdgeInsets(vertical: 12, horizontal: 12)) {
                    Button {
                        showDeparturesSheet = true
                    } label: {
                        Text(selectedDepartures.format(.dMMMMyyyy))
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)
                    }
                    .buttonStyle(.plain)
                } leadingIcon: {
                    Image(symbol: .calendar)
                        .font(.title3)
                        .foregroundStyle(.tripGray)
                }

            TripOptionView(
                "Class",
                spacing: 14,
                cornerRaduis: 12,
                edgeInsets: EdgeInsets(vertical: 12, horizontal: 12)) {
                    HStack {
                        Button(selectedClass.rawValue) {
                            showFlightClassSheet = true
                        }
                        .buttonStyle(.plain)

                        Image(symbol: .chevronDown)
                            .font(.caption2)
                            .foregroundStyle(.tripGray)
                            .offset(y: 1)
                    }
                } leadingIcon: {
                    Image(symbol: .chairLoungeFill)
                        .font(.title3)
                        .foregroundStyle(.tripGray)
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
                        .foregroundStyle(.tripGray)
                        .frame(width: 22, height: 22)
                })

            MainButton("Search The Flight") { }

            TripOptionView(
                edgeInsets: EdgeInsets(vertical: 17, horizontal: 17),
                leadingIcon: {
                    Image(asset: .discount)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.tripGray)
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

extension BooksYourFlightView {
    var passengersSheetView: some View {
        Picker("Picker", selection: $selectedPassengers) {
            ForEach(1..<10) { i in
                Text("\(i)")
                    .tag(i)
            }
        }
        .pickerStyle(.wheel)
    }
    
    var departuresSheetView: some View {
        DatePicker(
            "DatePicker",
            selection: $selectedDepartures,
            displayedComponents: .date
        )
        .datePickerStyle(.compact)
        .labelsHidden()
        .padding(.vertical, 30)
    }
    
    var flightClassSheetView: some View {
        Picker("Picker", selection: $selectedClass) {
            ForEach(FlightClassType.allCases) { flightClass in
                Text(flightClass.rawValue)
            }
        }
        .pickerStyle(.wheel)
        .padding()
    }
}

#Preview {
    BooksYourFlightView()
}
