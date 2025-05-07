//
//  TripOptionView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct TripOptionView<Icon, Detail>: View where Icon: View, Detail: View {

    private let leadingIcon: () -> Icon
    private let label: String?
    private let subLabel: () -> Detail
    private let spacing: CGFloat
    private let cornerRadius: CGFloat
    private let edgeInsets: EdgeInsets

    init(
        _ label: String? = nil,
        spacing: CGFloat = 24,
        cornerRaduis: CGFloat = 14,
        edgeInsets: EdgeInsets = EdgeInsets(vertical: 20, horizontal: 32),
        @ViewBuilder subLabel: @escaping () -> Detail = { EmptyView() },
        @ViewBuilder leadingIcon: @escaping () -> Icon = { EmptyView() }
    ) {
        self.label = label
        self.subLabel = subLabel
        self.leadingIcon = leadingIcon
        self.spacing = spacing
        self.cornerRadius = cornerRaduis
        self.edgeInsets = edgeInsets
    }

    var body: some View {
        VStack {
            HStack(spacing: spacing) {
                leadingIcon()

                if let label = label {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(label)
                            .font(.footnote)
                            .foregroundStyle(.tripGray)
                        
                        subLabel()
                            .font(.subheadline)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .padding(.top, edgeInsets.top)
        .padding(.leading, edgeInsets.leading)
        .padding(.trailing, edgeInsets.trailing)
        .padding(.bottom, edgeInsets.bottom)
        .background {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.tripSecondary)
        }
        .overlay {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(.tripStroke, lineWidth: 1)
        }
        .shadow()
    }
}



#Preview(traits: .sizeThatFitsLayout) {
    TripOptionView("From") {
        Text("San Francisco")
    } leadingIcon: {
        FlightDepartureIconView()
            .frame(height: 40)
    }
    .frame(height: 90)
    .frame(maxWidth: .infinity)
}

#Preview(traits: .sizeThatFitsLayout) {
    TripOptionView(
        "Class",
        spacing: 18,
        edgeInsets: EdgeInsets(vertical: 10, horizontal: 18)
    ) {
        HStack {
            Menu("Business") {
                Button {
                } label: {
                    Label("Business", systemImage: "2.circle.fill")
                }
            }
            .foregroundStyle(.label)
            
            Image(systemName: "chevron.down")
                .font(.caption2)
                .foregroundStyle(.tripGray)
                .offset(y: 2)
        }
    } leadingIcon: {
        Image(symbol: .chairLoungeFill)
            .font(.title2)
            .foregroundStyle(.tripGray)
    }
    .frame(width: 200)
}
