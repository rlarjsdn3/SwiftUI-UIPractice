//
//  TicketView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import UIKit
import SwiftUI

// MARK: - TicketView

struct TicketView<Header, Footer>: View where Header: View, Footer: View {
    
    // MARK: Properties
    
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
    
    
    // MARAK: Intializer
    
    init(
        ellipsisSize: CGFloat = 25,
        ellipsisOffset: CGFloat = 100,
        cornerRadius: CGFloat = 30,
        linePadding: CGFloat = 15,
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
        ZStack {
            ticketShape
            
            VStack(spacing: 0) {
                ticketHeaderView
                
                horizontalDashLine
                
                ticketFooterView
            }
        }
    }
    
    
    // MARK: Subviews
    
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
            .frame(maxWidth: .infinity)
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
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
    }
}





// MARK: - Previews

#Preview {
    TicketView {
        Text("Hello, TicketView!")
            .foregroundStyle(.black)
    } footerView: {
        Text("Hello, TicketView!")
            .foregroundStyle(.black)
    }
    .frame(height: 350)
    .padding()
}
