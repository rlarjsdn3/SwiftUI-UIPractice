//
//  CustomTabButton.swift
//  CustomTabView
//
//  Created by 김건우 on 2023/03/11.
//

import SwiftUI

struct CustomTabButton: View {
    @Binding var selected: TabItem
    var item: TabItem
    
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                selected = item
            }
        } label: {
            buttonLabel
        }
    }
}

extension CustomTabButton {
    var buttonLabel: some View {
        VStack(spacing: 0) {
            image
            text
        }
        .frame(width: 70, height: 50)
        .offset(y: selected == item ? -10 : 0)
    }
    
    var image: some View {
        Image(systemName: item.icon)
            .font(selected == item ? .title2 : .title3)
            .foregroundColor(
                selected == item ? item.accentColor : .gray
            )
    }
    
    var text: some View {
        Text(item.rawValue)
            .font(.caption)
            .foregroundColor(
                selected == item ? item.accentColor : .gray
            )
            .opacity(
                selected == item ? 1 : 0
            )
    }
}

struct CustomTabButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabButton(selected: .constant(.home), item: .home)
    }
}
