//
//  CalendarButtonStyle.swift
//  ElegantTask
//
//  Created by 김건우 on 2023/03/02.
//

import SwiftUI

struct CalendarButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title2)
            .padding(3)
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(8)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

extension ButtonStyle where Self == CalendarButtonStyle {
    static var calendarButtonStyle: Self { Self() }
}
