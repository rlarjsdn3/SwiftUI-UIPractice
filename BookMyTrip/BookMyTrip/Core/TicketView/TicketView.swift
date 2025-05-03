//
//  TicketView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import UIKit
import SwiftUI

struct TicketHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct TicketView<Header, Footer>: View where Header: View, Footer: View {
    
    @State private var dynamicHeight: CGFloat = 0

    var ellipsisSize: CGFloat
    var ellipsisOffset: CGFloat
    var cornerRadius: CGFloat
    var linePadding: CGFloat
    
    var headerView: () -> Header
    var footerView: () -> Footer
    
    var headerViewHeight: CGFloat {
        ellipsisOffset + (ellipsisSize / 2)
    }
    
    var horizontalLinePadding: CGFloat {
        linePadding + (ellipsisSize / 2)
    }

    init(
        ellipsisSize: CGFloat = 20,
        ellipsisOffset: CGFloat = 70,
        cornerRadius: CGFloat = 25,
        linePadding: CGFloat = 12.5,
        @ViewBuilder headerView: @escaping () -> Header,
        @ViewBuilder footerView: @escaping () -> Footer
    ) {
        self.ellipsisSize = ellipsisSize
        self.ellipsisOffset = ellipsisOffset
        self.cornerRadius = cornerRadius
        self.linePadding = linePadding
        self.headerView = headerView
        self.footerView = footerView
    }
    
    
    // MARK: Body
    
    var body: some View {
        ZStack(alignment: .top) {
            ticketShape

            VStack(spacing: 0) {
                ticketHeaderView
                horizontalDashLine
                ticketFooterView
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
    
    var ticketShape: some View {
        TicketShape(
            ellipsisSize: ellipsisSize,
            ellipsisOffset: ellipsisOffset,
            cornerRadius: cornerRadius
        )
        .commonShadow()
        .foregroundStyle(Color.travelSecondary)
        .overlay {
            TicketShape(
                ellipsisSize: ellipsisSize,
                ellipsisOffset: ellipsisOffset,
                cornerRadius: cornerRadius
            )
            .stroke(Color.travelStroke, lineWidth: 1)
        }
    }
    
    var ticketHeaderView: some View {
        headerView()
            .frame(height: headerViewHeight)
    }
    
    var horizontalDashLine: some View {
        HStack(spacing: 0) {
            Spacer(minLength: horizontalLinePadding)
            HorizontalLine(
                lineWidth: 1.5,
                lineCap: .square,
                lineJoin: .miter,
                miterLimit: 10,
                dash: [4, 10]
            )
            .fill(Color.travelGray)
            Spacer(minLength: horizontalLinePadding)
        }
    }
    
    var ticketFooterView: some View {
        footerView()
    }
}





// MARK: - Previews

#Preview {
    TicketView {
        Text("Hello, TicketView!")
            .padding(.top, 5)
    } footerView: {
        Text("Hello, TicketView!")
            .padding(.vertical)
    }
    .padding()
}
