//
//  TripWayButton.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

enum TripWay: CaseIterable {
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
        case .oneWay:   return MySymbol.arrowRight
        case .roundTrip: return MySymbol.arrowLeftRight
        }
    }
}
extension TripWay: Identifiable {
    var id: Self { self }
}

struct TripWayButton: View {

    let tripType: TripWay
    @Binding var selectedTripType: TripWay
    let action: () -> Void

    init(
        _ tripType: TripWay,
        selectedTripType: Binding<TripWay>,
        action: @escaping () -> Void
    ) {
        self.tripType = tripType
        self._selectedTripType = selectedTripType
        self.action = action
    }

    var body: some View {
        TripTypeButton(
            label: tripType.title,
            icon: tripType.symbol,
            tint: .travelPurple,
            isSelected: selectedTripType == tripType,
            action: {
                selectedTripType = tripType
                action()
            }
        )
    }
}

#Preview("TripWayButton", traits: .sizeThatFitsLayout) {
    TripWayButton(.oneWay, selectedTripType: .constant(.oneWay)) { }
}
