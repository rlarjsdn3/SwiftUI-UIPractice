//
//  BackgroundImageView.swift
//  Weather
//
//  Created by 김건우 on 2023/02/13.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        GeometryReader { geometry in
            Image("backgroundImage")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width)
                .ignoresSafeArea()
                .overlay {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
            }
        }
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
