//
//  TripTypeButton.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

enum TripType: CaseIterable {
    case oneWay
    case roundTrip

    var title: String {
        switch self {
        case .oneWay:    return "One Way"
        case .roundTrip: return "Round Trip"
        }
    }

    var symbol: MySymbol {
        switch self {
        case .oneWay:    return MySymbol.arrowRight
        case .roundTrip: return MySymbol.arrowLeftRight
        }
    }
}
extension TripType: Identifiable {
    var id: Self { self }
}

struct TripTypeButton: View {

    private let tripType: TripType
    @Binding private var selectedTripType: TripType
    private let action: () -> Void

    init(_ tripType: TripType) {
        self.init(
            tripType,
            selectedTripType: .constant(tripType),
            action: { }
        )
    }

    init(
        _ tripType: TripType,
        selectedTripType: Binding<TripType>,
        action: @escaping () -> Void
    ) {
        self.tripType = tripType
        self._selectedTripType = selectedTripType
        self.action = action
    }

    var body: some View {
        OptionButton(
            label: tripType.title,
            icon: tripType.symbol,
            tint: .tripPurple,
            isSelected: selectedTripType == tripType,
            action: {
                selectedTripType = tripType
                action()
            }
        )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TripTypeButton(.oneWay, selectedTripType: .constant(.oneWay)) { }
}
