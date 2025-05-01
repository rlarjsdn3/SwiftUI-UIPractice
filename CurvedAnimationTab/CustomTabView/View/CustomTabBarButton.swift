//
//  CustomTabBarButton.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/12.
//

import SwiftUI

struct CustomTabBarButton: View {
    var item: TabItem
    
    @Binding var selected: TabItem
    @Binding var tabPoint: [CGFloat]
    
    var body: some View {
        GeometryReader { geometry -> AnyView in
            DispatchQueue.main.async {
                if tabPoint.count < 4 {
                    tabPoint.append(geometry.frame(in: .global).midX)
                }
            }
            
            return AnyView(
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.65, blendDuration: 0.5)) {
                        selected = item
                        print(tabPoint)
                    }
                } label: {
                    Image(systemName:  item.icon)
                        .font(.system(.title2, weight: .semibold))
                        .foregroundColor(selected == item ? .black : .gray)
                        .offset(y: selected == item ? -10 : 0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
    }
}

struct CustomTabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarButton(
            item: TabItem.home,
            selected: .constant(.home),
            tabPoint: .constant([61.125])
        )
    }
}
