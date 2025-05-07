//
//  TicketView.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import UIKit
import SwiftUI

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
    
    /// 타원, 둥근 모서리, 헤더 및 푸터 뷰를 포함하는 커스텀 뷰를 초기화합니다.
    /// - Parameters:
    ///   - ellipsisSize: 타원의 크기 (지름, 기본값: 20)
    ///   - ellipsisOffset: 타원의 Y 축 위치 오프셋 (기본값: 70)
    ///   - cornerRadius: 사각형의 모서리 반경 (기본값: 25)
    ///   - linePadding: 선의 여백 (기본값: 12.5)
    ///   - headerView: 상단에 표시하는 뷰
    ///   - footerView: 하단에 표시하는 뷰
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
}

extension TicketView {

    private var ticketShape: some View {
        TicketShape(
            ellipsisSize: ellipsisSize,
            ellipsisOffset: ellipsisOffset,
            cornerRadius: cornerRadius
        )
        .shadow()
        .foregroundStyle(.tripSecondary)
        .overlay {
            TicketShape(
                ellipsisSize: ellipsisSize,
                ellipsisOffset: ellipsisOffset,
                cornerRadius: cornerRadius
            )
            .stroke(.tripStroke, lineWidth: 1)
        }
    }

    private var ticketHeaderView: some View {
        headerView()
            .frame(height: headerViewHeight)
    }

    private var horizontalDashLine: some View {
        HStack(spacing: 0) {
            Spacer(minLength: horizontalLinePadding)
            HorizontalLine(
                lineWidth: 1.5,
                lineCap: .square,
                lineJoin: .miter,
                miterLimit: 10,
                dash: [4, 10]
            )
            .fill(.tripGray)
            Spacer(minLength: horizontalLinePadding)
        }
    }

    private var ticketFooterView: some View {
        footerView()
    }
}




#Preview(traits: .sizeThatFitsLayout) {
    TicketView {
        Text("Hello, TicketView!")
            .padding(.top, 5)
    } footerView: {
        Text("Hello, TicketView!")
            .padding(.vertical)
    }
    .padding()
}
