//
//  TabBarButton.swift
//  AnimatedTabView
//
//  Created by 김건우 on 2023/02/22.
//

import SwiftUI

struct TabBarButton: View {
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    
    var body: some View {
        GeometryReader { geometry -> AnyView in
            let midX = geometry.frame(in: .global).midX
            print(midX)
            
            DispatchQueue.main.async {
                if tabPoints.count <= 4 {
                    tabPoints.append(midX)
                }
            }
            
            return AnyView(
                Button {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                        selectedTab = image
                    }
                } label: {
                    Image(systemName: image)
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(.black)
                        .offset(y: selectedTab == image ? -10 : 0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
        .frame(height: 50)
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(image: "house", selectedTab: .constant("house"), tabPoints: .constant([5]))
            .previewLayout(.sizeThatFits)
    }
}
