//
//  FlightClassSheetView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/4/25.
//

import SwiftUI

enum FlightClassType: String, CaseIterable {
    case economy = "Economy"
    case business = "Business"
    case firstClass = "First"
}
extension FlightClassType: Identifiable {
    var id: Self { self }
}

struct FlightClassSheetView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    FlightClassSheetView()
}
