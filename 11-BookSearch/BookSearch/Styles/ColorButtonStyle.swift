//
//  ColorButtonStyle.swift
//  BookSearch
//
//  Created by 김건우 on 2023/03/08.
//

import SwiftUI

struct ColorButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(20)
    }
}

struct Previews_ColorButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
