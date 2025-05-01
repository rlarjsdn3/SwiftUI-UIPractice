//
//  ThemeView.swift
//  Scrumdiger
//
//  Created by 김건우 on 2023/01/31.
//

import SwiftUI

struct ThemeCell: View {
    let theme: Theme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(theme.mainColor)
            Label(theme.name, systemImage: "paintpalette")
                .padding(4)
        }
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ThemeCell_Previews: PreviewProvider {
    static var previews: some View {
        ThemeCell(theme: .buttercup)
    }
}
