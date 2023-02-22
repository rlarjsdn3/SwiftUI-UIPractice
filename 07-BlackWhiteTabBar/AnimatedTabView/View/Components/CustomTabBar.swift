//
//  CustomTabBar.swift
//  AnimatedTabView
//
//  Created by 김건우 on 2023/02/22.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: String
    @State private var tabPoints: [CGFloat] = []
    
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "bookmark", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "message", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
        }
        .padding()
        .background(
            Color.white
                .clipShape(TabCurve(tabPoint: getCurvePoint() - 15))
        )
        .overlay(
            Circle()
                .fill(.white)
                .frame(width: 10, height: 10)
                .offset(x: getCurvePoint() - 20)
            , alignment: .bottomLeading
        )
        .cornerRadius(30)
        .padding(.horizontal)
    }
    
    func getCurvePoint() -> CGFloat {
        if self.tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
            case "house":
                return self.tabPoints[0]
            case "bookmark":
                return self.tabPoints[1]
            case "message":
                return self.tabPoints[2]
            case "person":
                return self.tabPoints[3]
            default:
                return self.tabPoints[0]
            }
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant("house"))
    }
}
