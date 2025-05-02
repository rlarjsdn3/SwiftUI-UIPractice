//
//  TripOptionView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/2/25.
//

import SwiftUI

struct TripOptionView<Icon, Detail>: View where Icon: View, Detail: View {

    let leadingIcon: () -> Icon
    let label: String?
    let subLabel: () -> Detail
    let spacing: CGFloat
    let cornerRadius: CGFloat
    let edgeInsets: EdgeInsets
    
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
                            .foregroundStyle(Color.travelGray)
                        
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
                .fill(Color.travelSecondary)
        }
        .overlay {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(Color.travelStroke, lineWidth: 1)
        }
        .commonShadow()
    }
}

#Preview("TripOptionButton #1", traits: .sizeThatFitsLayout) {
    TripOptionView("From") {
        Text("San Francisco")
    } leadingIcon: {
        DepartureIconView()
            .frame(height: 40)
    }
    .frame(height: 90)
    .frame(maxWidth: .infinity)
}

#Preview("TripOptionButton #2", traits: .sizeThatFitsLayout) {
    TripOptionView(
        "Class",
        spacing: 18,
        edgeInsets: EdgeInsets(vertical: 10, horizontal: 18)
    ) {
        HStack {
            Menu("Business") {
                Button {
                    
                } label: {
                    Label(
                        "Business",
                        systemImage: "2.circle.fill"
                    )
                }
            }
            
            Image(systemName: "chevron.down")
                .font(.caption2)
                .foregroundStyle(Color.travelGray)
                .offset(y: 2)
        }
    } leadingIcon: {
        Image(symbol: .chairLoungeFill)
            .font(.title2)
            .foregroundStyle(Color.travelGray)
    }
    .frame(width: 200)
}
