//
//  FindDealsButton.swift
//  BookMyTrip
//
//  Created by 김건우 on 5/1/25.
//

import SwiftUI

struct FindDealsButton: View {
    var link: FindDealsNavigationLink
    var action: () -> Void

    init(
        link: FindDealsNavigationLink,
        action: @escaping () -> Void
    ) {
        self.link = link
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Group {
                    if link.symbol == .airplane {
                        Image(symbol: link.symbol)
                            .rotationEffect(.degrees(-45))
                    } else {
                        Image(symbol: link.symbol)
                    }
                }
                .font(.title3)
                .foregroundStyle(.white)
                .frame(
                    width: 62.5,
                    height: 62.5
                )
                .background(
                    link.foregroundColor,
                    in: RoundedRectangle(cornerRadius: 20)
                )
                .commonShadow(
                    link.foregroundColor,
                    opacity: 0.44
                )
                .padding(.bottom, 4)

                Text(link.title)
                    .font(.subheadline)
                    .foregroundStyle(Color.label)
            }
        }
    }
}


#Preview {
    FindDealsButton(link: FindDealsNavigationLink.airplane) { }

}
