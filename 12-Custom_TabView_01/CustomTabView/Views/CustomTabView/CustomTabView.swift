//
//  CustomTabView.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/11.
//

import SwiftUI

enum TabItem: String, CaseIterable {
    case home = "Home"
    case search = "Search"
    case favorites = "Favorites"
    case settings = "Settings"
    
    var icon: String {
        switch self {
        case .home:
            return "house.fill"
        case .search:
            return "magnifyingglass.circle.fill"
        case .favorites:
            return "heart.fill"
        case .settings:
            return "gear"
        }
    }
    
    var accentColor: Color {
        switch self {
        case .home:
            return .orange
        case .search:
            return .blue
        case .favorites:
            return .cyan
        case .settings:
            return .purple
        }
    }
}

struct CustomTabView: View {
    @Namespace private var animation
    @Binding var selected: TabItem
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                CustomTabBarBuilder(tabItem: TabItem.allCases)
            }
            .background(
                RoundedRectangleBackground
            )
            .padding(.top, -20)
            .padding(.bottom, bottomSafeAreaInsets == 0 ? 5 : -20)
        }
    }
    
    @ViewBuilder
    func CustomTabBarBuilder(tabItem: [TabItem]) -> some View {
        ForEach(tabItem, id: \.self) { item in
            Spacer()
            CustomTabBarButtonBuilder(selected: $selected, item: item)
            Spacer()
        }
    }
    
    @ViewBuilder
    func CustomTabBarButtonBuilder(selected: Binding<TabItem>, item: TabItem) -> some View {
        CustomTabButton(selected: $selected, item: item)
            .overlay {
                if selected.wrappedValue == item {
                    CustomTabShape()
                        .fill(selected.wrappedValue.accentColor)
                        .frame(width: 45, height: 5)
                        .offset(y: -38)
                        .matchedGeometryEffect(id: "shape", in: animation)
                }
            }
            .frame(width: 70, height: 50)
    }
}

extension CustomTabView {
    var RoundedRectangleBackground: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(.white)
                    .frame(height: 120)
                    .frame(maxWidth: .infinity)
                
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(selected.accentColor, lineWidth: 0.5)
            }
            .offset(y: 20)
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(selected: .constant(.home))
            .previewLayout(.sizeThatFits)
    }
}
