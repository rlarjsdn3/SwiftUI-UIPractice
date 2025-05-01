//
//  CustomTabView.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/12.
//

import SwiftUI

enum TabItem: CaseIterable {
    case home
    case bookmark
    case search
    case settings
    
    var icon: String {
        switch self {
        case .home:
            return "house"
        case .bookmark:
            return "bookmark"
        case .search:
            return "magnifyingglass.circle"
        case .settings:
            return "gear.circle"
        }
    }
}

struct CustomTabView: View {
    @Namespace private var animation: Namespace.ID
    
    @State private var tabPoint: [CGFloat] = []
    @Binding var selected: TabItem
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabItem.allCases, id: \.self) { item in
                CustomTabBarButton(
                    item: item,
                    selected: $selected,
                    tabPoint: $tabPoint
                )
            }
        }
        .background(
            ZStack(alignment: .topLeading) {
                Color.white
                    .clipShape(TabCurveShape(midX: getTabPoint(selected) - 15))
                
                Circle()
                    .fill(.white)
                    .frame(width: 10, height: 10)
                    .offset(x: getTabPoint(selected) - 20, y: 60)
            }
        )
        .frame(height: 70)
        .cornerRadius(30)
        .padding()
    }
    
    func getTabPoint(_ item: TabItem) -> CGFloat {
        // tabPoint가 비어있으면
        if tabPoint.isEmpty {
            return -1 // 오류를 방지하기 위해 임시 값 반환
            
            // NOTE: - 임시 값을 반환해도 UI가 정상적으로 그려지는 이유는 tabPoint에 midX값이 추가(append)되면서 짧은 시간 내 UI가 새로 그려지기 때문이라고 추정됨.
            
        // tabPoint가 비어있지 않으면
        } else {
            // 각 아이템에 알맞는 midX값 반환
            switch item {
            case .home:
                return tabPoint[0]
            case .bookmark:
                return tabPoint[1]
            case .search:
                return tabPoint[2]
            case .settings:
                return tabPoint[3]
            }
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(selected: .constant(.home))
    }
}
