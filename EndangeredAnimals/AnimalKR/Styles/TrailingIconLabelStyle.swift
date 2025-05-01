//
//  TrailingIconLabelStyle.swift
//  AnimalKR
//
//  Created by 김건우 on 2023/02/21.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
        .fontWeight(.bold)
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
